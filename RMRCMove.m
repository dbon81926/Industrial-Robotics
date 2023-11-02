%% RMRC KUKA function template:
function RMRCMove(robot, pos1, pos2) % inputs are robot, first and second position
%% Allocate memory (put as properties)
%r = KUKAKR6R900;                                                            %Load robot
r = robot;
hold on
t = 10;                                                                     %Time
deltaT = 0.02;                                                              %Control frequency
steps = t/deltaT;                                                           %Steps derived from Time and control frequency
epsilon = 0.2;                                                              %Threshold for DLS/ Manipulability
W = diag([1 1 1 0.1 0.1 0.1]);                                              %Weighting Matrix (choose which values are more important for velocity)

m = zeros(steps,1);                                                         % Array for Measure of Manipulability
qMatrix = zeros(steps,6);                                                   % Array for joint angles
qdot = zeros(steps,6);                                                      % Array for joint velocities
theta = zeros(3,steps);                                                     % Array for roll-pitch-yaw angles
x = zeros(3,steps);                                                         % Array for x-y-z trajectory

%% Set up 3D trajectory (This is a straight line example, Two points:)
%x1 = transl(0.65, -0.65, 0.2);                                              
x1 = pos1;
%x2 = transl(0.65, 0.65, 0.2);                                               % Point 2
x2 = pos2;
%Straight line trajectory between x1 and x2 (you can create other
%trajectories
s = linspace(0, 1, steps);                                                  % Linearly spaced scalar
for i = 1:steps %x1 to x2
    % Interpolate between x1 and x2 using s(i) as a scaling factor
    x(:, i) = transl(x1 * (1 - s(i)) + x2 * s(i));
    % Set the orientation angles to constants or calculate as needed
    theta(1, i) = 0; % Roll angle
    theta(2, i) = pi/2; % Pitch angle
    theta(3, i) = 0; % Yaw angle
end
% Plot
plot3(x(1,:),x(2,:),x(3,:),'k.','LineWidth',1)

%% Calculation of the first transform
%Use ikcone/ikine to obtain the correct joint orientation (elbow up/down)
T = [rpy2r(theta(1,1),theta(2,1),theta(3,1))  x(:,1);zeros(1,3) 1];          % Create transformation of first point and angle
q0 = [0,   -0.2827,   -1.8396,   -1.1310,    4.6496,   -0.1257];                                                            % Initial guess for joint angles
%q0 = zeros(1,r.model.n);
qMatrix(1,:) = r.model.ikcon(T,q0);                                            % Solve joint angles to achieve first waypoint

%% RMRC calculation
for i = 1:steps-1
    % UPDATE: fkine function now returns an SE3 object. To obtain the
    % Transform Matrix, access the variable in the object 'T' with '.T'.
    T = r.model.fkine(qMatrix(i,:)).T;                                           % Get forward transformation at current joint state
    deltaX = x(:,i+1) - T(1:3,4);                                         	% Get position error from next waypoint
    Rd = rpy2r(theta(1,i+1),theta(2,i+1),theta(3,i+1));                     % Get next RPY angles, convert to rotation matrix
    Ra = T(1:3,1:3);                                                        % Current end-effector rotation matrix
    Rdot = (1/deltaT)*(Rd - Ra);                                                % Calculate rotation matrix error
    S = Rdot*Ra';                                                           % Skew symmetric!
    linear_velocity = (1/deltaT)*deltaX;
    angular_velocity = [S(3,2);S(1,3);S(2,1)];                              % Check the structure of Skew Symmetric matrix!!
    xdot = W*[linear_velocity;angular_velocity];                          	% Calculate end-effector velocity to reach next waypoint.
    J = r.model.jacob0(qMatrix(i,:));                                       % Get Jacobian at current joint state
    m(i) = sqrt(det(J*J'));                                                 % Yoshikawa's Measure of Manipulability
    %Attenuating damping
    if m(i) < epsilon                                                       % If manipulability is less than given threshold
        % Damping increased
        lambda = (1 - m(i)/epsilon)*5E-2;
    else
        % No damping
        lambda = 0;
    end
    %This is done because you cannot normally invert the Jacobian
    invJ = inv(J'*J + lambda *eye(6))*J';                                   % DLS Psuedo Inverse Jacobian
    qdot(i,:) = (invJ*xdot)';                                               % Solve the RMRC equation (you may need to transpose the vector)
    for j = 1:6                                                             % Loop through joints 1 to 6
        if qMatrix(i,j) + deltaT*qdot(i,j) < r.model.qlim(j,1)                     % If next joint angle is lower than joint limit...
            qdot(i,j) = 0; % Stop the motor
        elseif qMatrix(i,j) + deltaT*qdot(i,j) > r.model.qlim(j,2)                 % If next joint angle is greater than joint limit ...
            qdot(i,j) = 0; % Stop the motor
        end
    end
    qMatrix(i+1,:) = qMatrix(i,:) + deltaT*qdot(i,:);                         	% Update next joint state based on joint velocities
    % Animate
    r.model.animate(qMatrix(i,:));
    drawnow();

end
end


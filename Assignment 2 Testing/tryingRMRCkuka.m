%% Robotics
% Updated syntax and tested for V10 compatibility (Jan 2023)

% Lab 9 - Question 1 - Resolved Motion Rate Control in 6DOF
function tryingRMRCkuka()
% 1.1) Set parameters for the simulation
r = KUKAKR6R900(transl(0,0,0));        % Load robot model
hold on
t = 50;             % Total time (s)
deltaT = 0.02;      % Control frequency
steps = t/deltaT;   % No. of steps for simulation
delta = 2*pi/steps; % Small angle change
epsilon = 0.2;      % Threshold value for manipulability/Damped Least Squares
W = diag([1 1 1 0.1 0.1 0.1]);    % Weighting matrix for the velocity vector

% 1.2) Allocate array data
m = zeros(steps,1);             % Array for Measure of Manipulability
qMatrix = zeros(steps,6);       % Array for joint anglesR
qdot = zeros(steps,6);          % Array for joint velocities
theta = zeros(3,steps);         % Array for roll-pitch-yaw angles
x = zeros(3,steps);             % Array for x-y-z trajectory
x1tox2 = zeros(3,steps);
x2tox3 = zeros(3,steps);
positionError = zeros(3,steps); % For plotting trajectory error
angleError = zeros(3,steps);    % For plotting trajectory error

% 1.3) Set up trajectory, initial pose (This is some sinusoid)
% s = lspb(0,1,steps);                % Trapezoidal trajectory scalar
% for i=1:steps
%     x(1,i) = (1-s(i))*0.35 + s(i)*0.35; % Points in x
%     x(2,i) = (1-s(i))*-0.55 + s(i)*0.55; % Points in y
%     x(3,i) = 0.5 + 0.2*sin(i*delta); % Points in z
%     theta(1,i) = 0;                 % Roll angle
%     theta(2,i) = 5*pi/9;            % Pitch angle
%     theta(3,i) = 0;                 % Yaw angle
% end
%1.3.5) 
x1 = transl(0.65, -0.65, 0.2);
x2 = transl(0.65, 0.65, 0.2);
x3 = transl(-0.65,0.65,0.2);
x4 = transl(-0.65,-0.65,0.2);
%% Straight line
s = linspace(0, 1, steps); % Linearly spaced scalar
for i = 1:steps %x1 to x2
    % Interpolate between x1 and x2 using s(i) as a scaling factor
    x(:, i) = transl(x1 * (1 - s(i)) + x2 * s(i));
    % Set the orientation angles to constants or calculate as needed
    theta(1, i) = 0; % Roll angle
    theta(2, i) = pi/2; % Pitch angle
    theta(3, i) = 0; % Yaw angle
end
% for j = 1:steps
%     % Interpolate between x2 and x3 using s(j) as a scaling factor
%     x2tox3(:,j) = transl(x2 * (1 - s(j)) + x3 * s(j));
%     % Set the orientation angles for this segment
%     theta(1, steps + j) = 0; % Roll angle
%     theta(2, steps + j) = 0; % Pitch angle
%     theta(3, steps + j) = 0; % Yaw angle
% end
%x = [x1tox2; x2tox3];
%% Circle
%  % Define the center of the circular path
% center = transl(0, 0, 0.2);
% 
% % Define the radius of the circular path
% radius = norm(x1(1:3, 4) - center(1:3, 4));
% 
% % Generate the circular trajectory
% s = linspace(0, 2 * pi, steps); % Linearly spaced scalar for a full circle
% for i = 1:steps
%     % Calculate the x, y, and z coordinates of the circular path
%     x(1, i) = center(1) + radius * cos(s(i));
%     x(2, i) = center(2) + radius * sin(s(i));
%     x(3, i) = center(3);
% 
%     % Set the orientation angles to constants or calculate as needed
%     theta(1, i) = 0; % Roll angle
%     theta(2, i) = pi/2; % Pitch angle
%     theta(3, i) = 0; % Yaw angle
% end
%% End RMRC calculation
%Start end effector pose
T = [rpy2r(theta(1,1),theta(2,1),theta(3,1)) x(:,1);zeros(1,3) 1];          % Create transformation of first point and angle
q0 = [0,0.8796 ,0.6283,0.0000,-0.6283,0];                                                            % Initial guess for joint angles
%q0 = zeros(1,r.model.n);
qMatrix(1,:) = r.model.ikcon(T,q0);                                            % Solve joint angles to achieve first waypoint

% 1.4) Track the trajectory with RMRC
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
    deltaTheta = tr2rpy(Rd*Ra');                                            % Convert rotation matrix to RPY angles
    xdot = W*[linear_velocity;angular_velocity];                          	% Calculate end-effector velocity to reach next waypoint.
    J = r.model.jacob0(qMatrix(i,:));                 % Get Jacobian at current joint state
    m(i) = sqrt(det(J*J'));
    if m(i) < epsilon  % If manipulability is less than given threshold
        lambda = (1 - m(i)/epsilon)*5E-2;
    else
        lambda = 0;
    end
    invJ = inv(J'*J + lambda *eye(6))*J';                                   % DLS Inverse
    qdot(i,:) = (invJ*xdot)';                                                % Solve the RMRC equation (you may need to transpose the         vector)
    for j = 1:6                                                             % Loop through joints 1 to 6
        if qMatrix(i,j) + deltaT*qdot(i,j) < r.model.qlim(j,1)                     % If next joint angle is lower than joint limit...
            qdot(i,j) = 0; % Stop the motor
        elseif qMatrix(i,j) + deltaT*qdot(i,j) > r.model.qlim(j,2)                 % If next joint angle is greater than joint limit ...
            qdot(i,j) = 0; % Stop the motor
        end
    end
    qMatrix(i+1,:) = qMatrix(i,:) + deltaT*qdot(i,:);                         	% Update next joint state based on joint velocities
    positionError(:,i) = x(:,i+1) - T(1:3,4);                               % For plotting
    angleError(:,i) = deltaTheta;                                           % For plotting
    %DB = r.model.fkine(qMatrix(i,:))
    r.model.animate(qMatrix(i,:));
    drawnow();
    hold on
end

% 1.5) Plot the results
plot3(x(1,:),x(2,:),x(3,:),'k.','LineWidth',1)

%r.model.plot(qMatrix,'trail','r-')

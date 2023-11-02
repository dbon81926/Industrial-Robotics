%% Collision 
% Puck radius is 0.08 meters Or 0.171 m 

        

%% Making a sides of the game
close all 
clear all
hold on 
axis equal

Environment;
puck = RobotPuck(1);
puck.puckModel{1}.base = transl(0,0.0,0.55) ;
animate(puck.puckModel{1},0);
pause(0.01);
drawnow();

% Turn the following to a function file 

% Plane Left:
% Define the plane using the point and normal
plane1Origin = -0.5100;
p1Normal = [-1 0 0];
p1Point =  [ plane1Origin 0 0];
%plot the plane 
[Y1, Z1] = meshgrid(-1.5:0.1:1.5, -1.5:0.1:1.5);
X1 = repmat(plane1Origin , size(Y1,1), size(Z1,1));
% surf(X1,Y1,Z1);


% Plane Right:
%define the plane using the point and normal
plane2Origin = 0.51;
p2Normal = [-1 0 0];
p2Point =  [ plane2Origin 0 0];
% Plot the plane 
[Y2, Z2] = meshgrid(-1.5:0.1:1.5, -1.5:0.1:1.5);
X2 = repmat(plane2Origin , size(Y2,1), size(Z2,1));
% surf(X2,Y2,Z2);

% Kuka Plane
KukaPlane = -1.29;
KukaNormal = [0 -1 0];
KukaPoint =  [ 0 KukaPlane 0];
%plot the plane 
[X3, Z3] = meshgrid(-1.29:0.1:1.29, -1.29:0.1:1.29);
Y3 = repmat(KukaPlane , size(X3,1), size(Z3,1));
% surf(X3,Y3,Z3);

% UR5 Plane
UR5Plane = 1.29;
UR5Normal = [0 -1 0];
UR5Point =  [ 0 UR5Plane 0];
%plot the plane 
[X4, Z4] = meshgrid(-1.29:0.1:1.29, -1.29:0.1:1.29);
Y4 = repmat(UR5Plane , size(X4,1), size(Z4,1));
% surf(X4,Y4,Z4);



axis equal
%% Testing the Collision
% For the sides
for i = -1 : 0.01 : 1
    Puckcenter = [i,0,0.5];

    [intersectionPoints1,check1] = LinePlaneIntersection(p1Normal,p1Point,Puckcenter,Puckcenter);
   
    % Check the collision with the second plane
    [intersectionPoints2,check2] = LinePlaneIntersection(p2Normal,p2Point,Puckcenter,Puckcenter);

    if check1 == 2
        plot3(intersectionPoints1(1),intersectionPoints1(2),intersectionPoints1(3) ,'k*','MarkerSize',20);
        disp(" collision Detected 1")
    end

    if check2 == 2
        plot3(intersectionPoints2(1),intersectionPoints2(2),intersectionPoints2(3) ,'k*','MarkerSize',20);
        disp(" collision Detected 2")
    end

end
% For Goals
for i = -1.5 : 0.005 : 1.5
    Puckcenter = [-0.5,i,0.6];

    [intersectionPoints3,check3] = LinePlaneIntersection(KukaNormal,KukaPoint,Puckcenter,Puckcenter);
    % Check the collision with the second plane
    [intersectionPoints4,check4] = LinePlaneIntersection(UR5Normal,UR5Point,Puckcenter,Puckcenter);

    if check3 == 2
        plot3(intersectionPoints3(1),intersectionPoints3(2),intersectionPoints3(3) ,'k*','MarkerSize',20);
        disp(" GOAL UR5");
    end

    if check4 == 2
        plot3(intersectionPoints4(1),intersectionPoints4(2),intersectionPoints4(3) ,'k*','MarkerSize',20);
        disp(" GOAL KuKA");
    end
end

%% Insert the puck and overlay the point over the puck
% puck = RobotPuck(1);
for i = -1.5 : 0.005 : 1.5

    puck.puckModel{1}.base = transl(0,i,0.55) ;
    animate(puck.puckModel{1},0);
    pause(0.01);
    drawnow();

    Puckcenter = puck.puckModel{1}.base.t';

% Check Collision
    [intersectionPoints3,check3] = LinePlaneIntersection(KukaNormal,KukaPoint,Puckcenter,Puckcenter);
    [intersectionPoints4,check4] = LinePlaneIntersection(UR5Normal,UR5Point,Puckcenter,Puckcenter);

    if check3 == 2
        plot3(intersectionPoints3(1),intersectionPoints3(2),intersectionPoints3(3) ,'k*','MarkerSize',20);
        disp(" GOAL UR5");
    end

    if check4 == 2
        plot3(intersectionPoints4(1),intersectionPoints4(2),intersectionPoints4(3) ,'k*','MarkerSize',20);
        disp(" GOAL KuKA");
    end
end
%% Bouncing Puck off the wall after a Collision

% First I want the puck to hit the wall and the collision to be detected
    movement = transl(0,0.05,0);
    puck.puckModel{1}.base = transl(0,0,0.55) * trotz(1,'deg') ;
    animate(puck.puckModel{1},0);
    pause(0.01);
    drawnow();
    Puckcenter = puck.puckModel{1}.base.t';

    %%
    while(1)
    % Puckcenter_P = puck.puckModel{1}.base.t'
    puck.puckModel{1}.base = puck.puckModel{1}.base.T * movement ;
    animate(puck.puckModel{1},0);
    pause(0.01);
    drawnow();
    try delete(tr_p); end
    tr_p = trplot(puck.puckModel{1}.base.T);
    Puckcenter_P = Puckcenter;
    Puckcenter = puck.puckModel{1}.base.t';

% Check Collision
    [intersectionPoints3,check3] = LinePlaneIntersection(KukaNormal,KukaPoint,Puckcenter_P,Puckcenter);
    disp(check3);
    [intersectionPoints4,check4] = LinePlaneIntersection(UR5Normal,UR5Point,Puckcenter_P,Puckcenter);
    disp(check4);
    % What to do if a COllision is detected
    if check3 == 1
        plot3(intersectionPoints3(1),intersectionPoints3(2),intersectionPoints3(3) ,'k*','MarkerSize',20);
        disp(" GOAL UR5");
        rise = Puckcenter(2) - Puckcenter_P(2);
        run = Puckcenter(1) - Puckcenter_P(1);
        IncomingAngle = atan(rise/run);
        puck.puckModel{1}.base = puck.puckModel{1}.base.T * trotz(2*IncomingAngle) * movement ;
        animate(puck.puckModel{1},0);
        pause(0.01);
        drawnow();
        try delete(tr_p); end
        tr_p = trplot(puck.puckModel{1}.base.T);
        % Puckcenter_P = puck.puckModel{1}.base.t';
        Puckcenter = puck.puckModel{1}.base.t'
        

    end

    if check4 == 1
        plot3(intersectionPoints4(1),intersectionPoints4(2),intersectionPoints4(3) ,'k*','MarkerSize',20);
        disp(" GOAL KuKA");
        rise = Puckcenter(2) - Puckcenter_P(2);
        run = Puckcenter(1) - Puckcenter_P(1);
        IncomingAngle = atan(rise/run);
        puck.puckModel{1}.base = puck.puckModel{1}.base.T * trotz(2*IncomingAngle) * movement ;
        animate(puck.puckModel{1},0);
        pause(0.01);
        drawnow();
        try delete(tr_p); end
        tr_p = trplot(puck.puckModel{1}.base.T);
        % Puckcenter_P = puck.puckModel{1}.base.t';
        Puckcenter = puck.puckModel{1}.base.t'

    end
    % Puckcenter_P = Puckcenter;
    end
%% Bounce with angles

% 1. Get the incoming Traj
rise = Puckcenter(2) - Puckcenter_P(2);
run = Puckcenter(1) - Puckcenter_P(1);
IncomingAngle = atan(rise/run);





close all
clear all
axis equal 
Assign2.Workspace;

%%
U_base = [0,1.5,0.5];
K_base = [0,-1.60,0.5];
P_base = [0, 0 , 0.5];

U_guess_pos = [ 0   -1.0347    2.2842   -2.7925   -1.5708         0];
K_guess_pos = [0    0.8712    0.3142   -0.6680         0         0];

K = KUKAKR6R900(transl(K_base));
U = UR5(transl(U_base));
puck = RobotPuck(1);
puck.puckModel{1}.base = transl(P_base);
%% position the endeffector of the robots to the starting position

xPositions = linspace(0.5,-0.5,3);
puck.puckModel{1}.base = transl(P_base);
animate(puck.puckModel{1},0);
next_position_U = U.model.ikcon( SE3(U_base).T*SE3(0,-0.5,0).T* trotx(pi)*trotz(pi/2), U_guess_pos);
U.model.animate(next_position_U);
drawnow();


next_position_K = K.model.ikcon( SE3(K_base).T * SE3(0,0.5,0).T * trotx(pi)*trotz(pi/2), K_guess_pos );
K.model.animate(next_position_K);
drawnow();



 %% Moving the UR5


for i = 1:size(xPositions,2)

    pos_U = U.model.ikcon( (SE3(U_base).T * SE3(xPositions(i), -0.5 , 0).T * trotx(pi)), U.model.getpos);
    traj = jtraj(U.model.getpos(), pos_U, 100);

    % Create a traj for the puck from its current position to the contact point
    currentPuck = puck.puckModel{1}.base.t';
    goalPuck = SE3(U_base).T * SE3(xPositions(i), -0.5 , 0).T * trotx(pi);
    goalPuck = goalPuck(1:3,4)';

    pos_Px = linspace(currentPuck(1),goalPuck(1),100);
    pos_Py = linspace(currentPuck(2),goalPuck(2),100);

    for y = 1:size(traj,1)
        puck.puckModel{1}.base = transl( pos_Px(y),pos_Py(y), 0.5);
        U.model.animate(traj(y,:));
        drawnow();
        animate(puck.puckModel{1},0);
    end


% Moving the Kuka

    pos_K = K.model.ikcon( (SE3(K_base).T * SE3(xPositions(i), 0.5 , 0).T * trotx(pi)), K.model.getpos);
    traj = jtraj(K.model.getpos(), pos_K, 100);

    currentPuck = puck.puckModel{1}.base.t';
    goalPuck = SE3(K_base).T * SE3(xPositions(i), 0.5 , 0).T * trotx(pi);
    goalPuck = goalPuck(1:3,4)';

    pos_Px = linspace(currentPuck(1),goalPuck(1),100);
    pos_Py = linspace(currentPuck(2),goalPuck(2),100);




    for y = 1:size(traj,1)
        puck.puckModel{1}.base = transl( pos_Px(y),pos_Py(y), 0.5);
        animate(puck.puckModel{1},0);
        K.model.animate(traj(y,:));
        drawnow();
        animate(puck.puckModel{1},0);
    end


end
%%
next_position_U = U.model.ikcon( SE3(U_base).T*SE3(0,-0.5,0).T* trotx(pi)*trotz(pi/2), U_guess_pos);
U.model.animate(next_position_U);
drawnow();


next_position_K = K.model.ikcon( SE3(K_base).T * SE3(0,0.5,0).T * trotx(pi)*trotz(pi/2), K_guess_pos );
K.model.animate(next_position_K);
drawnow();


close all
clear all
axis equal 

U_base = [-1 0 0];
K_base = [1 0 0];

K_guess_pos = [0    0.8712    0.3142   -0.6680         0         0];

K = KUKAKR6R900(transl(K_base) * trotz(pi));
U = UR5(transl(U_base));
%% position the endeffector of the robots to the starting position

yPositions = linspace(0.4,-0.4,10);


next_position_U = U.model.ikcon( SE3(U_base).T*SE3(0.5,0,0).T* trotx(pi), U.model.getpos());
U.model.animate(next_position_U);
drawnow();


next_position_K = K.model.ikcon( SE3(K_base).T * SE3(-0.5,0,0).T * trotx(pi), K_guess_pos );
K.model.animate(next_position_K);
drawnow();



 %% Moving the UR5
for i = 1:size(yPositions,2)
    pos_U = U.model.ikcon( (SE3(U_base).T * SE3(0.4, yPositions(i) , 0).T * trotx(pi)), U.model.getpos);
    traj = jtraj(U.model.getpos(), pos_U, 100);
    for y = 1:size(traj,1)
        U.model.animate(traj(y,:));
        drawnow();
    end


% Moving the Kuka

    pos_K = K.model.ikcon( (SE3(K_base).T * SE3(-0.4, yPositions(i) , 0).T * trotx(pi)), K.model.getpos);
    traj = jtraj(K.model.getpos(), pos_K, 100);
    for y = 1:size(traj,1)
        K.model.animate(traj(y,:));
        drawnow();
    end
    fkinepos = K.model.fkine(K.model.getpos).t';
    % plot3(fkinepos(1),fkinepos(2),fkinepos(3));

end


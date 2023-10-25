classdef Assign2 < handle 

    properties (Constant)
        U_base = transl(0,1.35,0.5) * trotz(pi/2); %Initial position of Robot
    end

    methods (Static) 
        function [] = Workspace()

            axis equal

            %Load Tables
            table1 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0])
            hold on
            table2 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,-1,0])
            hold on
            table3 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,1,0])
            hold on


            %Load Fire Extinguisher
            fireExtinguisher = PlaceObject('fireExtinguisher.ply',[-1.3,1.5,0])
            hold on
            fireExtinguisher = PlaceObject('fireExtinguisher.ply',[1.3,-1.5,0])
            hold on
            

            %Emergency Stop Button
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[0.8,1.3,0.5])
            hold on
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[-0.8,-1.3,0.5])
            hold on

            base = Assign2.U_base;
            Robot = UR3(base); %Load in robot to base position

            assignin('base', 'Robot', Robot);
            input('Done');
            Robot.model.teach(Robot.model.getpos)
            qStart = zeros(1,Robot.model.n); %Initialise robot
        end

        function [] = StartPos()
            %% Set the robot to its Starting Position
            next_position_U = U.model.ikcon( SE3(U_base).T*SE3(0.5,0,0).T* trotx(pi), U.model.getpos());
            U.model.animate(next_position_U);
            drawnow();
            next_position_K = K.model.ikcon( SE3(K_base).T * SE3(-0.5,0,0).T * trotx(pi), K_guess_pos );
            K.model.animate(next_position_K);
            drawnow();
        end

        function [] = Move()
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
            end
        end
            

    end
end


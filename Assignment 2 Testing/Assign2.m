classdef Assign2 < handle 

    properties (Constant)
        base = transl(0,1.35,0.5) * trotz(pi/2); %Initial position of Robot
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

            base = Assign2.base;
            Robot = UR3(base); %Load in robot to base position

            
            assignin('base', 'Robot', Robot);
            input('Done');
            Robot.model.teach(Robot.model.getpos)

            qStart = zeros(1,Robot.model.n); %Initialise robot
        end
    end
end


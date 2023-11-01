base = transl(0,1.35,0.5) * trotz(pi/2); %Initial position of UR3
Kuka_base = transl(0,-2.0,0) * trotz(pi/2); %Initial position of KR6 R900

            axis equal

            %Load Fences

            fence1 = PlaceObject('fenceFinal.ply',[-1.5,1.40,0])
            hold on
            fence2 = PlaceObject('fenceFinal.ply',[-1.5,0.60,0])
            hold on
            % fence3 = PlaceObject('fenceFinal.ply',[-1.5,-0.20,0])
            % hold on
            fence4 = PlaceObject('fenceFinal.ply',[-1.5,-1.0,0])
            hold on
            fence17 = PlaceObject('fenceFinal.ply',[-1.5,-1.8,0])


            fence5 = PlaceObject('fenceFinal.ply',[1.50,-1.80,0])
            hold on
            fence6 = PlaceObject('fenceFinal.ply',[1.50,-1.00,0])
            hold on
            % fence7 = PlaceObject('fenceFinal.ply',[1.50,-0.20,0])
            % hold on
            fence8 = PlaceObject('fenceFinal.ply',[1.50,0.60,0])
            hold on
            fence18 = PlaceObject('fenceFinal.ply',[1.50,1.40,0])
            hold on

            fence9 = PlaceObject('fenceFinal.ply',[2.2,-1.2,0]); 
            verts = [get(fence9,'Vertices'), ones(size(get(fence9,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence9,'Vertices',verts(:,1:3))
            hold on

            fence10 = PlaceObject('fenceFinal.ply',[2.2,-0.4,0]); 
            verts = [get(fence10,'Vertices'), ones(size(get(fence10,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence10,'Vertices',verts(:,1:3))
            hold on

            fence11 = PlaceObject('fenceFinal.ply',[2.2,0.4,0]); 
            verts = [get(fence11,'Vertices'), ones(size(get(fence11,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence11,'Vertices',verts(:,1:3))
            hold on

            fence12 = PlaceObject('fenceFinal.ply',[2.2,1.2,0]);
            verts = [get(fence12,'Vertices'), ones(size(get(fence12,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence12,'Vertices',verts(:,1:3))
            hold on

            fence13 = PlaceObject('fenceFinal.ply',[-2.1,-1.2,0]); 
            verts = [get(fence13,'Vertices'), ones(size(get(fence13,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence13,'Vertices',verts(:,1:3))
            hold on

            fence14 = PlaceObject('fenceFinal.ply',[-2.1,-0.4,0]); 
            verts = [get(fence14,'Vertices'), ones(size(get(fence14,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence14,'Vertices',verts(:,1:3))
            hold on

            fence15 = PlaceObject('fenceFinal.ply',[-2.1,0.4,0]); 
            verts = [get(fence15,'Vertices'), ones(size(get(fence15,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence15,'Vertices',verts(:,1:3))
            hold on

            fence16 = PlaceObject('fenceFinal.ply',[-2.1,1.2,0]); 
            verts = [get(fence16,'Vertices'), ones(size(get(fence16,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(fence16,'Vertices',verts(:,1:3))
            hold on

            

            %Load Tables
            table1 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0])
            hold on
            table2 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,-1,0])
            hold on
            table3 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,1,0])
            hold on


            %Load Fire Extinguisher
            fireExtinguisher = PlaceObject('fireExtinguisher.ply',[1.3,-2.0,0])
            hold on
            

            %Emergency Stop Button
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[0.8,1.3,0.5])
            hold on
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[-0.8,-1.3,0.5])
            hold on

            base = Assign2.base;
            Robot = UR3(base); %Load in UR3

            Kuka_base = Assign2.Kuka_base;
            Robot2 = KUKAKR6R900(Kuka_base);

           
            % K = KUKAKR6R900(transl(0,-1.35,0.5)) * trotz(pi/2); %load in KR6900
            
            assignin('base', 'Robot', Robot);
            input('Done');
            % Robot.model.teach(Robot.model.getpos)
            % 
            % qStart = zeros(1,Robot.model.n); %Initialise robot


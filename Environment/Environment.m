base = transl(0,1.35,0.60) * trotz(pi/2); %Initial position of UR3
Kuka_base = transl(0,-1.60,0.5) * trotz(pi/2); %Initial position of KR6 R900

            axis equal

            %Load Fences

            fence1 = PlaceObject('fenceFinal.ply',[-1.5,1.40,0]);
            hold on
            fence2 = PlaceObject('fenceFinal.ply',[-1.5,0.60,0]);
            hold on
            % fence3 = PlaceObject('fenceFinal.ply',[-1.5,-0.20,0])
            % hold on
            fence4 = PlaceObject('fenceFinal.ply',[-1.5,-1.0,0]);
            hold on
            fence17 = PlaceObject('fenceFinal.ply',[-1.5,-1.8,0]);


            fence5 = PlaceObject('fenceFinal.ply',[1.50,-1.80,0]);
            hold on
            fence6 = PlaceObject('fenceFinal.ply',[1.50,-1.00,0]);
            hold on
            % fence7 = PlaceObject('fenceFinal.ply',[1.50,-0.20,0])
            % hold on
            fence8 = PlaceObject('fenceFinal.ply',[1.50,0.60,0]);
            hold on
            fence18 = PlaceObject('fenceFinal.ply',[1.50,1.40,0]);
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

            %Load Height Booster for KR6 900
            % heightBooster = PlaceObject('kuka_block.ply',[0,-1.9,0]);
            % hold on

            %Load Barriers on Table
            barrier1 = PlaceObject('barrier.ply',[0,1.35,0.5]);
            hold on
            barrier2 = PlaceObject('barrier.ply',[0.31,1.35,0.5]);
            hold on
            barrier3 = PlaceObject('barrier.ply',[-0.31,1.35,0.5]);
            hold on 
            barrier4 = PlaceObject('barrier.ply',[0.50,1.35,0.5]);
            hold on
            barrier5 = PlaceObject('barrier.ply',[-0.50,1.35,0.5]);
            hold on

            barrier6 = PlaceObject('barrier.ply',[0,-1.35,0.5]);
            hold on
            barrier7 = PlaceObject('barrier.ply',[0.31,-1.35,0.5]);
            hold on
            barrier8 = PlaceObject('barrier.ply',[-0.31,-1.35,0.5]);
            hold on 
            barrier9 = PlaceObject('barrier.ply',[0.50,-1.35,0.5]);
            hold on
            barrier10 = PlaceObject('barrier.ply',[-0.50,-1.35,0.5]);
            hold on

            barrier11 = PlaceObject('barrier.ply',[0,0.65,0.5]); 
            verts = [get(barrier11,'Vertices'), ones(size(get(barrier11,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier11,'Vertices',verts(:,1:3))
            hold on

            barrier12 = PlaceObject('barrier.ply',[0.3,0.65,0.5]); 
            verts = [get(barrier12,'Vertices'), ones(size(get(barrier12,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier12,'Vertices',verts(:,1:3))
            hold on

            barrier13 = PlaceObject('barrier.ply',[0.6,0.65,0.5]); 
            verts = [get(barrier13,'Vertices'), ones(size(get(barrier13,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier13,'Vertices',verts(:,1:3))
            hold on

            barrier14 = PlaceObject('barrier.ply',[0.9,0.65,0.5]); 
            verts = [get(barrier14,'Vertices'), ones(size(get(barrier14,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier14,'Vertices',verts(:,1:3))
            hold on

            barrier15 = PlaceObject('barrier.ply',[-0.3,0.65,0.5]); 
            verts = [get(barrier15,'Vertices'), ones(size(get(barrier15,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier15,'Vertices',verts(:,1:3))
            hold on

            barrier16 = PlaceObject('barrier.ply',[-0.6,0.65,0.5]); 
            verts = [get(barrier16,'Vertices'), ones(size(get(barrier16,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier16,'Vertices',verts(:,1:3))
            hold on

            barrier17 = PlaceObject('barrier.ply',[-0.9,0.65,0.5]); 
            verts = [get(barrier17,'Vertices'), ones(size(get(barrier17,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier17,'Vertices',verts(:,1:3))
            hold on

            barrier18 = PlaceObject('barrier.ply',[-1.2,0.65,0.5]); 
            verts = [get(barrier18,'Vertices'), ones(size(get(barrier18,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier18,'Vertices',verts(:,1:3))
            hold on

            barrier19 = PlaceObject('barrier.ply',[1.2,0.65,0.5]); 
            verts = [get(barrier19,'Vertices'), ones(size(get(barrier19,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier19,'Vertices',verts(:,1:3))
            hold on

            barrier20 = PlaceObject('barrier.ply',[0,-0.65,0.5]); 
            verts = [get(barrier20,'Vertices'), ones(size(get(barrier20,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier20,'Vertices',verts(:,1:3))
            hold on

            barrier21 = PlaceObject('barrier.ply',[0.3,-0.65,0.5]); 
            verts = [get(barrier21,'Vertices'), ones(size(get(barrier21,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier21,'Vertices',verts(:,1:3))
            hold on

            barrier22 = PlaceObject('barrier.ply',[0.6,-0.65,0.5]); 
            verts = [get(barrier22,'Vertices'), ones(size(get(barrier22,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier22,'Vertices',verts(:,1:3))
            hold on

            barrier23 = PlaceObject('barrier.ply',[0.9,-0.65,0.5]); 
            verts = [get(barrier23,'Vertices'), ones(size(get(barrier23,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier23,'Vertices',verts(:,1:3))
            hold on

            barrier24 = PlaceObject('barrier.ply',[-0.3,-0.65,0.5]); 
            verts = [get(barrier24,'Vertices'), ones(size(get(barrier24,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier24,'Vertices',verts(:,1:3))
            hold on

            barrier25 = PlaceObject('barrier.ply',[-0.6,-0.65,0.5]); 
            verts = [get(barrier25,'Vertices'), ones(size(get(barrier25,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier25,'Vertices',verts(:,1:3))
            hold on

            barrier26 = PlaceObject('barrier.ply',[-0.9,-0.65,0.5]); 
            verts = [get(barrier26,'Vertices'), ones(size(get(barrier26,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier26,'Vertices',verts(:,1:3))
            hold on

            barrier27 = PlaceObject('barrier.ply',[-1.2,-0.65,0.5]); 
            verts = [get(barrier27,'Vertices'), ones(size(get(barrier27,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier27,'Vertices',verts(:,1:3))
            hold on

            barrier28 = PlaceObject('barrier.ply',[1.2,-0.65,0.5]); 
            verts = [get(barrier28,'Vertices'), ones(size(get(barrier28,'Vertices'),1),1)] * trotz(pi/2); %rotating the side of this fence around the z-axis
            verts(:,1) = verts(:,1) * 1; %1 square units in length
            set(barrier28,'Vertices',verts(:,1:3))
            hold on

            
            %Load blocker to end effector 
            blocker1 = PlaceObject('blocker.ply',[0,0,1.2]);
            hold on
            
            % %Load Blocker
            % blocker1 = PlaceObject('blocker.ply',[0,0,0.5])
            % hold on


        
            %Load Tables
            table1 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0]);
            hold on
            table2 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,-1,0]);
            hold on
            table3 = PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,1,0]);
            hold on


            %Load Fire Extinguisher
            fireExtinguisher = PlaceObject('fireExtinguisher.ply',[1.3,-2.0,0]);
            hold on
            

            %Emergency Stop Button
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[0.9,0.9,0.5]);
            hold on
            Emergency_StopButton = PlaceObject('emergencyStopButton.ply',[-0.9,-0.9,0.5]);
            hold on

            Robot = UR5(base); %Load in UR3
            Robot2 = KUKAKR6R900(Kuka_base); %Load in KR6 R900

           
            % K = KUKAKR6R900(transl(0,-1.35,0.5)) * trotz(pi/2); %load in KR6900
            
           
            % Robot.model.teach(Robot.model.getpos)
            % 
            % qStart = zeros(1,Robot.model.n); %Initialise robot



# Industrial-Robotics 41013 Spring 2023

Karl Cincollagas: 13918180 <br>
Naga Bonu: 13908948 <br>
Bhupesh Guddi: 13877446 <br>

Game Description:

Create a game where 2 robots are hitting a puck between each other using wooden planks. Various safety features are implemented, as well as interactive GUI with emergency stop functionality. A visual demonstration will be shown where the UR3 will be mimicking the simulated UR3's positions. 

Update Log: <br>
25/9: Established DH Parameters of KUKA KR6 R900 Robot Arm. <br>
11/10: Completed KUKA KR6 R900 ply files and model. <br>
13/10: Workspace Established with inital safety features + UR3. <br>
14/10: Integrated both robots and environment <br>
15/10: App Designer GUI jogging done. <br>
18/10: Emergency Stop arduino done, missing MATLAB communication. <br>
19/10: Full GUI with working simulated emergency stop completed. <br>

Tasks To Complete:

Robots + Environemnt:
1. [X] Finalise a project for A2
2. [X] Create DH Parameters for KR6 900
3. [X] Establish an environment that incoroprates safety features for project to take place
4. [X] Integrate robots + environment
5. [ ] Make robot heights level
7. [ ] Create puck and wooden plank (to placed inside gripper) on CAD
8. [ ] Use Blender/Mesh lab to convert CAD files into ply files which can be integrated into the environment

Making Robot Heights Level:

Write process

Creation of GUI: <br>
1. [X] Advanced teach function
2. [X] Robot Jogging including cartesian and rotation movement
3. [X] Forward kinematics display


Emergency Stop: <br>
1. [X] E-Stop onto GUI.
2. [X] System reacts to E-stop immediately
3. [X] E-Stop requries two actions to reset
4. [X] Robots can still be jogged during engaged E-Stop
5. [X] E-Stop disables certain functions when engaged
6. [X] Physical E-Stop requires two actions to reset
7. [X] Physical E-Stop communicates with MATLAB
8. [ ] Physical E-Stop can interrupt MATLAB simulation


Game/Puck Movement: <br>
1. [ ] Puck starts with UR3
2. [ ] Collides with UR3 wooden plank and rebounces to a randomly selected trajectory onto the side of the KR6 R900
3. [ ] KR6 900 calculates and moves its wooden plank to puck
4. [ ] KR6 900 detects collision between plank and puck
5. [ ] Repeat steps 3 & 4 with UR3
6. [ ] Process continues until all random trajectory points have been achieved
7. [ ] Integrate collision detection/RMRC into movement 


Collision Detection/Avoidance <br>


Possible Scoring System: <br>

Real-Demo Implementation/Visual Servoing of Pong Game:



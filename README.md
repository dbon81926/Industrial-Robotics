# Industrial-Robotics 41013 Spring 2023

Karl Cincollagas: 13918180 <br>
Naga Bonu: 13908948 <br>
Bhupesh Guddi: 13877446 <br>

Game Description:

Create a game where 2 robots are hitting a puck between each other using wooden planks. Various safety features are implemented, as well as interactive GUI with emergency stop functionality. A visual demonstration will be shown where the UR3 will be mimicking the simulated UR3's positions. 

Instructions: <br>
- Place the @KUKAKR6R900 folder into the robot toolbox path "/rvctools/robot/UTS/RobotModels". <br>
  To use the model, create an instance using "r = KUKAKR6R900". "r.model" can be used normally, E.g. "r.model.teach". <br>
- All Environment ".ply" files can be placed within the same path as the class file, or can be placed in "/rvctools/robot/UTS/Parts". <br>
- 
  

Update Log: <br>
25/9: Established DH Parameters of KUKA KR6 R900 Robot Arm. <br>
11/10: Completed KUKA KR6 R900 ply files and model. <br>
13/10: Workspace Established with inital safety features + UR3. <br>
14/10: Integrated both robots and initial environment <br>
15/10: App Designer GUI jogging done. <br>
18/10: Emergency Stop arduino done, missing MATLAB communication. <br>
19/10: Full GUI with working simulated emergency stop completed. <br>
19/10: Changed robot to UR5 to increase range (got approval) <br>
19/10: Completed environment + safety features <br>
25/10: Finished inital movement of puck and contact with robots end effectors <br>
27/10: 1-min Promotional Video completed and submitted as Youtube link <br>
1/11: Real video taken of UR3 moving to end-effector position using joint angles of game <br>

Tasks To Complete:

Robots + Environment: <br>
1. [X] Finalise a project for A2
2. [X] Create DH Parameters for KR6 900
3. [X] Establish an environment that incoroprates safety features for project to take place
4. [X] Integrate robots + environment
5. [X] Make robot heights level
7. [X] Create puck and wooden plank (to placed inside gripper) on CAD
8. [X] Use Blender/Mesh lab to convert (CAD) SLDPRT. files into STL. files
9. [X] Scale and make visible using vertex painting --> Export as PLY. files
10. [X] Import ply files into the MATLAB


Creation of GUI: <br>
1. [X] Advanced teach function
2. [X] Robot Jogging including cartesian and rotation movement
3. [X] Forward kinematics display


Emergency Stop: <br>
1. [X] E-Stop onto GUI
2. [X] System reacts to E-stop immediately
3. [X] E-Stop requries two actions to reset
4. [X] Robots can still be jogged during engaged E-Stop
5. [X] E-Stop disables certain functions when engaged
6. [X] Physical E-Stop requires two actions to reset
7. [X] Physical E-Stop communicates with MATLAB
8. [ ] Physical E-Stop can interrupt MATLAB simulation


1-min Promotional Video: <br>
1. [X] Movement of puck to be translating between both robots
2. [X] Make contact with end effector of robots
3. [X] Install CapCut as software to create our video
4. [X] Create a storyline/background images/subtitles and narrator for our video
5. [X] Convert audio files into mp3 links to be imported into CapCut
6. [X] Place both specifications of robot beside eah other for comparison
7. [X] Screen record features and various angles of environment
8. [X] Integrate game into GUI
9. [X] Demonstrate advanced teach module controlling KR6 900
10. [X] Display emergency stop and reset working in simulation
11. [X] Display real life emergency stop working with Arduino
12. [X] Conclude video
   


Game/Puck Movement: <br>
1. [X] Puck starts in the middle 
2. [X] Collides with UR3 end effector and rebounces to a randomly selected trajectory onto the side of the KR6 R900
3. [X] KR6 900 detects collision between end effector and puck
4. [X] Code wooden plank to align with end effector to contact the puck
6. [X] Repeat steps 3 & 4 with UR3
7. [X] Process continues until all random trajectory points have been achieved
8. [X] Integrate collision detection/RMRC into movement 



Week 12 Demo Presentation (Create PowerPoint): <br>
1. [X] Environment + Justify
2. [X] Safety + Justify
3. [X] Thought Process + Reasoning 
4. [X] Specs of Robots + Comparison
5. [X] RMRC + Collision Implemented
6. [X] Approval + Justification to use UR5 instead of UR3
7. [X] Real UR3 moving to simulation end effector points
8. [X] Conclusion

3min Final Video: <br>

1. [ ] Purpose: Systems purpose is to provide an entertainment using two robot manipulators. The robot manipulators play out a game of air hockey. Spectators can bet on which robot could be the winner.
2. [ ] Talk about DH parameters (spec sheet).
3. [ ] Inverse kinematics was used to solve the joint angles of the system. The robots end-effector was controlled within a set path by multiplying transforms. Inverse kinematics was used to calculate the joint angles for this controlled path.
4. [ ] GUI: MATLAB App Designer was used. Class format. You can control joint angles using teach. You can jog the robot relative to the end effectors coordinate frame, as well as Roll Pitch Yaw. The start game button is located.
5. [ ] RMRC: Resolve motion rate control was used to control the end effectors path in a straight line, although the calculation seemed to lag the simulation. We needed to switch to another approach for visuals sake. (Talk about RMRC function), importance of RMRC.
6. [ ] Safety: Barriers for puck, fence for outsiders, 2 Estops for each robot, Fire extinguisher for fire hazard. EStop requires password ‘reset’ to reengage.

7. [ ] GUI: Show controlling each robot (jogging and teach), Estop in motion, Display of End effector pose. Homing of robot.

8. [ ] Extensions: mention we did not do the extension.

9. [ ] Used Robot toolbox to create DH parameters. Used Class format of modified Toolbox to created Robot model. (Lab 3 was used to model) other stuff like git.

10. [ ] We can use sensors and cameras to detect the pucks location, which the robot can use to move the end effector. The implementation of RMRC alongside the pucks movement caused issues (parallel processing). The robots can be used

11. [ ] Find future solutions for project

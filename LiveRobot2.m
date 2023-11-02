 %% Real Robot Control

        function RealRobotControl

            % Initialising a connection to the ROS computer

            rosinit('192.168.27.1');

            jointStateSubscriber = rossubscriber('joint_states','sensor_msgs/JointState');

            %% Getting the current joint state of the real robot

            pause(2); % Pausing to allow for rosmessage to appear

            currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)';

            currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];

            

            % Creating variable with joint names

            %% Allows joint commands to be associated to particular joints

            jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};

            % Creating array of joint states to follow

            jointStates = [ 0.6343   -0.6493   -1.2095   -1.2827    3.7761    0.0003;
    0.6435   -0.6345   -1.2272   -1.2821    3.7841   -0.0015;
    0.6578   -0.6097   -1.2594   -1.2789    3.7963   -0.0046;
    0.6755   -0.5777   -1.3033   -1.2723    3.8116   -0.0086;
    0.6961   -0.5400   -1.3564   -1.2626    3.8296   -0.0129;
    0.7195   -0.4981   -1.4166   -1.2501    3.8503   -0.0169;
    0.7456   -0.4527   -1.4819   -1.2354    3.8736   -0.0204;
    0.7746   -0.4050   -1.5503   -1.2192    3.8997   -0.0231;
    0.8063   -0.3556   -1.6204   -1.2021    3.9288   -0.0249;
    0.8411   -0.3052   -1.6906   -1.1848    3.9609   -0.0258;
    0.8790   -0.2543   -1.7600   -1.1679    3.9962   -0.0258;
    0.9200   -0.2034   -1.8274   -1.1520    4.0347   -0.0250;
    0.9644   -0.1528   -1.8924   -1.1375    4.0765   -0.0236;
    1.0120   -0.1029   -1.9543   -1.1247    4.1216   -0.0216;
    1.0630   -0.0538   -2.0127   -1.1140    4.1701   -0.0193;
    1.1175   -0.0060   -2.0675   -1.1055    4.2219   -0.0167;
    1.1754    0.0404   -2.1182   -1.0991    4.2771   -0.0139;
    1.2368    0.0848   -2.1646   -1.0950    4.3357   -0.0112;
    1.3017    0.1271   -2.2067   -1.0930    4.3975   -0.0085;
    1.3700    0.1666   -2.2442   -1.0929    4.4627   -0.0059;
    1.4418    0.2031   -2.2769   -1.0944    4.5311   -0.0034;
    1.5171    0.2358   -2.3048   -1.0972    4.6028   -0.0012;
    1.5960    0.2645   -2.3278   -1.1009    4.6779    0.0008;
    1.6784    0.2885   -2.3459   -1.1049    4.7565    0.0026;
    1.7646    0.3073   -2.3591   -1.1089    4.8387    0.0042;
    1.8544    0.3206   -2.3675   -1.1124    4.9246    0.0056;
    1.9481    0.3280   -2.3711   -1.1147    5.0143    0.0068;
    2.0453    0.3290   -2.3700   -1.1157    5.1078    0.0079;
    2.1458    0.3236   -2.3644   -1.1148    5.2048    0.0087;
    2.2488    0.3117   -2.3545   -1.1120    5.3049    0.0094;
    2.3532    0.2934   -2.3403   -1.1071    5.4069    0.0100;
    2.4575    0.2693   -2.3222   -1.1004    5.5096    0.0104;
    2.5597    0.2400   -2.3005   -1.0921    5.6110    0.0106;
    2.6576    0.2064   -2.2755   -1.0826    5.7090    0.0105;
    2.7489    0.1695   -2.2475   -1.0724    5.8014    0.0098;
    2.8316    0.1304   -2.2170   -1.0619    5.8860    0.0083;
    2.9042    0.0900   -2.1841   -1.0513    5.9613    0.0056;
    2.9659    0.0490   -2.1488   -1.0406    6.0263    0.0010;
    3.0166    0.0078   -2.1113   -1.0297    6.0807   -0.0059;
    3.0568   -0.0334   -2.0714   -1.0185    6.1249   -0.0154;
    3.0876   -0.0748   -2.0290   -1.0069    6.1598   -0.0275;
    3.1101   -0.1166   -1.9841   -0.9950    6.1865   -0.0422;
    3.1260   -0.1588   -1.9366   -0.9830    6.2064   -0.0590;
    3.1365   -0.2014   -1.8866   -0.9710    6.2208   -0.0779;
    3.1432   -0.2444   -1.8342   -0.9591    6.2311   -0.0986;
    3.1471   -0.2876   -1.7795   -0.9475    6.2383   -0.1211;
    3.1492   -0.3309   -1.7230   -0.9360    6.2435   -0.1453;
    3.1503   -0.3740   -1.6646   -0.9248    6.2473   -0.1710;
    3.1507   -0.4170   -1.6048   -0.9137    6.2502   -0.1983;
    3.1509   -0.4598   -1.5437   -0.9026    6.2525   -0.2271;];
                
               

            % For loop used to send sequential commands to the real UR3 robot
%%
            for i = 1:size(jointStates,1)

            % Setting UR3 goal states
                [client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
                goal.Trajectory.JointNames = jointNames;
                goal.Trajectory.Header.Seq = i;
                goal.Trajectory.Header.Stamp = rostime('Now','system');
                goal.GoalTimeTolerance = rosduration(0.05);
                bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
                durationSeconds = 10; % This is how many seconds the movement will take
                startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
                startJointSend.Positions = currentJointState_123456;
                startJointSend.TimeFromStart = rosduration(0);
    
                endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');

                nextJointState_123456 = jointStates(i,:);

                endJointSend.Positions = nextJointState_123456;

                endJointSend.TimeFromStart = rosduration(durationSeconds);

                goal.Trajectory.Points = [startJointSend; endJointSend];

                goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);

                %% Sending the command to the UR3

                sendGoal(client,goal);

                %pause; % Pausing robot (waits until user input to recieve next command)
%%
 
                % Updating the current joint state to new current position

                currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)';

                currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];
                %input('Press Enter to Continue')

            end

        end
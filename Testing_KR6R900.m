clf;
r = KUKAKR6R900(transl(0,1,0));
hold on
%link = PlaceObject('KUKAKR6R900Link2.ply', [0,1,0]);
L = UR3;

L(1) = Link('d', 0.400 , 'a', 0.025, 'alpha', -pi/2 ,'qlim', deg2rad([-170,170]));
L(2) = Link('d', 0, 'a', 0.455, 'alpha', 0 ,'qlim', deg2rad([-100,135]),'offset', -pi/2);
L(3) = Link('d', 0 , 'a', 0.035, 'alpha', pi/2 ,'qlim',  deg2rad([-120,156]));
L(4) = Link('d', -0.455 , 'a', 0, 'alpha', -pi/2 ,'qlim',  deg2rad([-185,185]));
L(5) = Link('d', 0 , 'a', 0, 'alpha', pi/2 ,'qlim',  deg2rad([-120,120]));
L(6) = Link('d', -0.08 , 'a', 0, 'alpha', pi ,'qlim',  deg2rad([-350,350]));


% KR6 = SerialLink(L,'name','kuka');
% q = zeros(1,KR6.n);
% KR6.plot(q)
% 
% hold on

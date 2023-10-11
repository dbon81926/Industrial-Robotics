%% KUKA KR6 R900 
classdef KUKAKR6R900 < RobotBaseClass
    %% KR6 R900
    % Class created by UTS students during Spring 2023 41013.
    % Students responsible: 13918180, 13908948, 13877446
    properties(Access = public)

        plyFileNameStem = 'KUKAKR6R900';
    end

    methods (Access = public)
        function self = KUKAKR6R900(baseTr)
            self.CreateModel();
            if nargin == 1
                self.model.base = self.model.base.T * baseTr;
            end
            self.homeQ = [0,0,0,0,0,0];
            self.PlotAndColourRobot();
        end

        %% CreateModel
        function CreateModel(self)
            % DH parameters obtained from: https://www.kuka.com/-/media/kuka-downloads/imported/8350ff3ca11642998dbdc81dcc2ed44c/0000205456_en.pdf
            L(1) = Link('d', 0.400 , 'a', 0.025, 'alpha', -pi/2 ,'qlim', deg2rad([-170,170]));
            L(2) = Link('d', 0, 'a', 0.455, 'alpha', 0 ,'qlim', deg2rad([-100,135]),'offset', -pi/2);
            L(3) = Link('d', 0 , 'a', 0.035, 'alpha', pi/2 ,'qlim',  deg2rad([-120,156]));
            L(4) = Link('d', -0.455 , 'a', 0, 'alpha', -pi/2 ,'qlim',  deg2rad([-185,185]));
            L(5) = Link('d', 0 , 'a', 0, 'alpha', pi/2 ,'qlim',  deg2rad([-120,120]));
            L(6) = Link('d', -0.08 , 'a', 0, 'alpha', pi ,'qlim',  deg2rad([-350,350]));
            self.model = SerialLink(L,'name',self.name);
        end
    end
end
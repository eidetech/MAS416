classdef forward_euler
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        t=0
        idx = 1
        g = 9.81
        dt = 10^-3
        simTime
        y = 0
        yDot = 0
        yDotDot = 0
        timePlot = []
        yPlot = []
        yDotPlot = []
        yDotDotPlot = []
    end

    methods
            function self = forward_euler(simTime, y, yDot)
                self.simTime = simTime;
                self.y = y
                self.yDot = yDot
            end
            function simulate(self)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            subplot(1,2,1)
            plot(self.timePlot, self.yPlot, 'LineWidth',2)
            xlim([0 self.simTime])
            subplot(1,2,2)
            plot(self.timePlot, self.yDotPlot, 'LineWidth',2)
            xlim([0 self.simTime])
            end
            function time_integrate(self)
                self.timePlot(self.idx) = self.t;
                self.yPlot(self.idx) = self.y;
                self.yDotPlot(self.idx) = self.yDot;
                
                self.y = self.y+self.yDot*self.dt;
                self.yDot = self.yDot+self.yDotDot*self.dt;
                
                self.t = self.t+self.dt;
                self.idx=self.idx+1;

            end
    end
end
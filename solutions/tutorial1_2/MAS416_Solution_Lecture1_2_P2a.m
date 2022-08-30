close all;
clear;
%Initialize
counter = 1;
time = 0;
y = 0;
EndTime = 1.0;
StepTime = 1e-4;
while time<EndTime
    yDot = (3-y)/0.2;
    %Save data for plotting
    tPlot(counter) = time;
    yPlot(counter) = y;
    yDotPlot(counter) = yDot;
    %Time integrate
    y = y + yDot*StepTime;
    time = time + StepTime;
    counter = counter + 1;
end
plot(tPlot,yPlot);
grid;
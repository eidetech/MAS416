close all;
clear;
%Initialize
counter = 1;
time = 0;
y = 0;
yDot = 0;
EndTime = 1.0;
StepTime = 1e-4;
while time<EndTime
    yDotDot = 100*(3-y)-12*yDot;
    %Save data for plotting
    tPlot(counter) = time;
    yPlot(counter) = y;
    yDotPlot(counter) = yDot;
    %Time integrate
    y = y + yDot*StepTime;
    yDot = yDot + yDotDot*StepTime;
    time = time + StepTime;
    counter = counter + 1;
end
plot(tPlot,yPlot);
grid;
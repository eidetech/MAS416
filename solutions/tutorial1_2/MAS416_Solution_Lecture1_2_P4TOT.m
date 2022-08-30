close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%Basic data
k=40e3;
c=0;
m=100;
g=9.81;
EndTime=5.0;
StepTime=1e-5;
y_Init=0;
yDot_Init=0;
%Initialize
for i=1:4
    switch i
        case 1
            F0=0;
            wp=0;
        case 2
            F0=500;
            wp=10;
        case 3
            F0=500;
            wp=20;
        case 4
            F0=500;
            wp=30;
    end
    Time=0.0;
    y=y_Init;
    yDot=yDot_Init;
    %Initialize
    Counter=1;
    %Start time integration
    while Time<EndTime
        %Compute acceleration
        yDotDot=(F0*sin(wp*Time)-m*g-k*y-c*yDot)/m;
        %report
        Time_Plot(Counter)=Time;
        y_Plot(Counter)=y;
        yDot_Plot(Counter)=yDot;
        yDotDot_Plot(Counter)=yDotDot;
        %Time integrate
        y=y+yDot*StepTime;
        yDot=yDot+yDotDot*StepTime;
        Time=Time+StepTime;
        Counter=Counter+1;
    end;
    plot(Time_Plot,y_Plot);
    if i==1
        hold on;
    end;
end;
grid;
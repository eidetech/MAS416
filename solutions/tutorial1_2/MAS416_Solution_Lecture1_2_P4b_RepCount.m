close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%Basic data
F0=500;
wp=10;
k=40e3;
c=500;
m=100;
g=9.81;
EndTime=2.0;
StepTime=1e-5;
y_Init=0;
yDot_Init=0;
%Initialize
%Current values of y, yDot and yDotDot for Time = 0
%Initially old values are simply set to current values
Time=0.0;
y=y_Init;
yDot=yDot_Init;
%Initialize counters so that plot data is only saved once pr. a number of
%time steps corresponding to ReportInterval
ReportCounter=0;
ReportInterval=100;
Counter=ReportInterval;
%Start time integration
while Time<EndTime
    %Compute acceleration
    yDotDot=(F0*sin(wp*Time)-m*g-k*y-c*yDot)/m;
    %report
    if Counter==ReportInterval
        Counter=0;
        ReportCounter=ReportCounter+1;
        Time_Plot(ReportCounter)=Time;
        y_Plot(ReportCounter)=y;
        yDot_Plot(ReportCounter)=yDot;
        yDotDot_Plot(ReportCounter)=yDotDot;
    end;
    %Time integrate
    y=y+yDot*StepTime;
    yDot=yDot+yDotDot*StepTime;
    Time=Time+StepTime;
    Counter=Counter+1;
end;
plot(Time_Plot,y_Plot);
grid;
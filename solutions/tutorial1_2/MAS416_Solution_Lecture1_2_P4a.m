close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%Basic data
k=40e3;
c=500;
m=100;
g=9.81;
EndTime=2.0;
StepTime=1e-5;
%Initialize
Time=0.0;
y=0;
yDot=0;
%Initialize
Counter=1;
%Start time integration
while Time<EndTime
    %Compute acceleration
    Delta=y;
    DeltaDot=yDot;
    yDotDot=(-m*g-k*Delta-c*DeltaDot)/m;
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
grid;
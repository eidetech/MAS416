close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%y-coordinate is measured relative to deformed spring (steady state position)
%Basic data
F0=500; %F(t)=F0*sin(wp*t)
wp=10;
k=40e3;
c=500;
m=100;
g=9.81;
L0=1; %1m
delta_ss=m*g/k; %Steady state compression of spring
%Time data
EndTime=2.0;
StepTime=1e-5;
%Initialize
Time=0.0;
y=delta_ss;
yDot=0;
Counter=1;
%Start time integration
while Time<EndTime
    %Compute acceleration
    Ft=F0*sin(wp*Time);
    Fk=k*(y-delta_ss);
    Fc=c*yDot;
    yDotDot=(Ft-Fk-Fc-m*g)/m;
    %Save data for plotting
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
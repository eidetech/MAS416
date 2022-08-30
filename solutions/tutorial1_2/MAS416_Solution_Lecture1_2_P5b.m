close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%Basic data
M0=75;
wp=20;
kTheta=1800;
bTheta=8;
J=2;
EndTime=4.0;
StepTime=1e-5;
theta_Init=25*pi/180;
thetaDot_Init=0;
%Initialize
Time=0.0;
theta=theta_Init;
thetaDot=thetaDot_Init;
%Initialize 
Counter=1;
%Start time integration
while Time<EndTime
    %Compute angular acceleration
    thetaDotDot=(M0*sin(wp*Time)-kTheta*theta-bTheta*thetaDot)/J;
    %report
    Time_Plot(Counter)=Time;
    theta_Plot(Counter)=theta*180/pi;
    thetaDot_Plot(Counter)=thetaDot;
    thetaDotDot_Plot(Counter)=thetaDotDot;
     %Time integrate
    theta=theta+thetaDot*StepTime;
    thetaDot=thetaDot+thetaDotDot*StepTime;
    Time=Time+StepTime;
    Counter=Counter+1;
end;
plot(Time_Plot,theta_Plot);
grid;
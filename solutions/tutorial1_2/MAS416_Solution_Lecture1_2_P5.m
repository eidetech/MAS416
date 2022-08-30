close all;
clear;
%Numerical time integration of mass spring damper
%Starting from unstretched spring
%Starting from rest
%Basic data
M0=75;
wp=40;
kTheta=1800;
bTheta=8;
J=2;
EndTime=4.0;
StepTime=1e-5;
theta_Init=25*pi/180;
thetaDot_Init=0;
%Initialize
%Current values of theta, thetaDot and thetaDotDot for Time = 0
%Initially old values are simply set to current values
Time=0.0;
theta=theta_Init;
thetaDot=thetaDot_Init;
%Initialize counters so that plot data is only saved once pr. a number of
%time steps corresponding to ReportInterval
ReportCounter=0;
ReportInterval=100;
Counter=ReportInterval;
%Start time integration
while Time<EndTime
    %Compute angular acceleration
    thetaDotDot=(M0*sin(wp*Time)-kTheta*theta-bTheta*thetaDot)/J;
    %report
    if Counter==ReportInterval
        Counter=0;
        ReportCounter=ReportCounter+1;
        Time_Plot(ReportCounter)=Time;
        theta_Plot(ReportCounter)=theta*180/pi;
        thetaDot_Plot(ReportCounter)=thetaDot;
        thetaDotDot_Plot(ReportCounter)=thetaDotDot;
    end;
    %Time integrate
    theta=theta+thetaDot*StepTime;
    thetaDot=thetaDot+thetaDotDot*StepTime;
    Time=Time+StepTime;
    Counter=Counter+1;
end;
plot(Time_Plot,theta_Plot);
grid;
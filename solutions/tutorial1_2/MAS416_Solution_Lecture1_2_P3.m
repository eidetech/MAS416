%Close all figures and clear memory
close all;
clear;
%Constant data
g=9.81;
L=0.7;
%Initial values
fi=pi/4;
fiDot=2;
%Time data
Time=0.0;
EndTime=8.0;
h=1e-4;
Counter=1;
%Time loop
while Time<EndTime
    %Compute angular acceleration
    fiDotDot=-g/L*sin(fi);
    %Save plot data
    TimePlot(Counter)=Time;
    fiPlot(Counter)=fi*180/pi;
    fiDotPlot(Counter)=fiDot;
    %Update state variables (Forward Euler)
    fi=fi+fiDot*h;
    fiDot=fiDot+fiDotDot*h;
    Time=Time+h;
    Counter=Counter+1;
end;
plot(TimePlot,fiPlot);
grid;
% figure;
% plot(TimePlot,fiDotPlot);
% grid;
    
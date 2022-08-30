%This programs plot a sinus function y = A*t^2+B
%The time t goes y reaches a certain value = 10
%The parameter A is fixed at 1
%The parameter B reduces linearly from 1 to 0 in the first 2 seconds and
%then remains = 0
%The program begins
%Close all old plots
close all;
%Clear memory
clear;
%Set parameters
A=1; %Frequency
B_initial=1; %Initial value of B
t_Zero=2; %Time when B becomes zero permanently
yMax=10; %Max value of y
%Do a while loop
h=0.01; %Step period
i=1; %Initialize counter
t=0; %Initialize time
y=B_initial; %Initialize y
while y<yMax
    if t<=t_Zero
        B=B_initial*(1-t);
    else
        B=0;
    end;
    y=A*t^2+B;
    %Save data for plotting
    tPlot(i)=t;
    yPlot(i)=y;
    BPlot(i)=B;
    %Increase time
    t=t+h;
    %Increase counter
    i=i+1;
end;
%Plot
plot(tPlot,yPlot);
grid;
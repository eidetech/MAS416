%This programs plot a sinus function y = A*sin(2*pi*f*t)
%The time t goes from 0s to 15s
%The frequency f is fixed at 0.5Hz
%The amplitude A jumps from 1 to 2 to 3 in intervals of 5 seconds
%The program begins
%Close all old plots
close all;
%Clear memory
clear;
%Set parameters
f=0.5; %Frequency
EndTime=15; %End time
%Do a for loop
n=1000; %Number of plotted points
for i=1:n
    t=(i-1)*EndTime/(n-1); %Makes sure that t goes from 0 to 15
    %Compute amplitude based on time
    if t<=5
        A=1;
    elseif t<=10
        A=2;
    else
        A=3;
    end;
    y=A*sin(2*pi*f*t); %Compute y
    %Save data for plotting
    tPlot(i)=t;
    yPlot(i)=y;
end;
%Plot
plot(tPlot,yPlot);
grid;

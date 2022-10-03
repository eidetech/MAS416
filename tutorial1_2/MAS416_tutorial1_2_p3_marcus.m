%% Tutorial 1 & 2, P3
clc; clear all; close all;
tic
L = 0.7; % m
m = 24; % kg
g = 9.81; % gravity

phi = pi/4; % rad
phiDot = 2; % rad/s

simTime = 8; % s

idx = 1;
dt = 10^-3;
t = 0;

while t <= simTime

phiDotDot = -g/L * sin(phi);

timePlot(idx) = t;
phiPlot(idx) = phi;
phiDotPlot(idx) = phiDot;
phiDotDotPlot(idx) = phiDotDot;

phi = phi+phiDot*dt;
phiDot = phiDot + phiDotDot*dt;

idx = idx+1;
t = t+dt;
end

toc

plot(timePlot, rad2deg(phiPlot))
grid on
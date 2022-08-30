%% Tutorial 1 & 2, P3
clc; clear all; close all;
tic
L = 0.7; % m
m = 24; % kg
g = 9.81; % gravity

phi = pi/4; % deg
phi_dot = 2; % rad/s

simTime = 8; % s

idx = 1;
dt = 10^-3;
t = 0;

while t <= simTime

phi_dotdot = -g/L * sin(phi);

timePlot(idx) = t;
phi_plot(idx) = phi;
phi_dotPlot(idx) = phi_dot;
phi_dotdotPlot(idx) = phi_dotdot;

phi = phi+phi_dot*dt;
phi_dot = phi_dot + phi_dotdot*dt;

idx = idx+1;
t = t+dt;
end

toc

subplot(3,1,1)
plot(timePlot, rad2deg(phi_plot))
grid on
hold on
subplot(3,1,2)
plot(timePlot, rad2deg(phi_dotPlot))
subplot(3,1,3)
plot(timePlot, phi_dotdotPlot)
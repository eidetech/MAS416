%% Tutorial 1 & 2, P4
clc; clear all; close all;

J = 2; % kg*m^2
k_theta = 1800; % Nm/rad
b_theta = 8; % Nms/rad
M_0 = 0;
omega_p = 0;

theta = deg2rad(25); % rad
theta_dot = deg2rad(0); % rad

simTime = 4;

t = 0;
idx = 1;
dt = 10^-4;

while t<simTime

    M = M_0*sin(omega_p*t)

    timePlot(idx) = t;
    mPlot(idx) = M;
    mDotPlot = MDot;

    M = M+MDot*dt;
    

end
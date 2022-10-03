% Tutorial 1 & 2, P4
clc; clear all; close all;

J = 2; % kg*m^2
k_theta = 1800; % Nm/rad
b_theta = 8; % Nms/rad

% Init state variables
theta = deg2rad(25); % rad
theta_dot = deg2rad(0); % rad

simTime = 4; % s

t = 0; % s
dt = 10^-4; % s;
idx = 1; % counter init

M_0 = [0 75 75 75]; % Nm
omega_p = [0 20 30 40]; % rad/s

for i = 1:length(M_0)
    while(t <= simTime)
        % Calculations
        M = M_0(i)*sin(omega_p(i)*t)
    
        % Logging
        timePlot(idx) = t;
        theta_plot(idx) = theta;
        thetaDot_plot(idx) = thetaDot;
    
        % Time Integration
        theta = theta + thetaDot * dt;
        thetaDot = thetaDot + thetaDotDot * dt;
        
        % Update variables
        t = t + dt;
        idx = idx + 1;
    
    end
    t = 0;
    idx = 1;
    
end

plot(timePlot, theta_plot)
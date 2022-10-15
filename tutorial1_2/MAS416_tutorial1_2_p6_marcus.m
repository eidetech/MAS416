%% Tutorial 1 & 2, P6
clc; clear all; close all;

% Known constants
A = 0.2; % m
B = 0.1; % m/s
L_0 = 0.1; % m
k = 1000; % N/m

F_0 = 500; % N
v_0 = 0.01; % m/s

x = 0.1; % m
xDot = 0; % m/s

m = 300; % kg
g = 9.81; % m/s^2
theta = deg2rad(30); % rad


simTime = 25; % s
t = 0; % s
idx = 1; % index/counter
dt = 10^-4; % timestep

while(t <= simTime)

    % Calculations
    x_0 = A+B*t;
    
    delta = x_0 - x - L_0;
    
    if (delta >= 0)
    F_k = k*delta;
    else
    F_k = 0;
    end

    Ffr = F_0 * tanh(xDot/v_0); % N
    G_x = m*g*sin(theta); % N

    xDotDot = (F_k - Ffr - G_x)/m;

    % Logging
    time_plot(idx) = t;
    x_plot(idx) = x;
    xDot_plot(idx) = xDot;

    % Time integrate
    x = x + xDot * dt;
    xDot = xDot + xDotDot * dt;

    % Update variables
    t = t + dt;
    idx = idx + 1;
end

plot(time_plot, x_plot/10^-3)
grid
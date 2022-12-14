% Tutorial 1 & 2, P4
clc; clear all; close all;

J = 2; % kg*m^2
k_theta = 1800; % Nm/rad
b_theta = 8; % Nms/rad

% Init state variables
theta = deg2rad(25); % rad
thetaDot = deg2rad(0); % rad/s
thetaDotDot = 0;

simTime = 4; % s

t = 0; % s
dt = 10^-4; % s;
idx = 1; % counter init

M_0 = [0 75 75 75]; % Nm
omega_p = [0 20 30 40]; % rad/s

for i = 1:length(M_0)
    while(t <= simTime)
        % Calculations
        M = M_0(i)*sin(omega_p(i)*t);

        T_k = k_theta * theta;
        T_b1 = b_theta * thetaDot;
        thetaDotDot = 1/J *(M - T_k - T_b1);
    
        % Logging (putting each for index into separate columns)
        timePlot(idx,i) = t;
        theta_plot(idx,i) = theta;
        thetaDot_plot(idx,i) = thetaDot;
    
        % Time Integration
        theta = theta + thetaDot * dt;
        thetaDot = thetaDot + thetaDotDot * dt;
        
        % Update variables
        t = t + dt;
        idx = idx + 1;
    
    end
    % Reset initial condition
    t = 0;
    idx = 1;
    theta = deg2rad(25); % rad
    thetaDot = deg2rad(0); % rad/s
    thetaDotDot = 0;
end

subplot(2,2,1)
plot(timePlot(:,1), rad2deg(theta_plot(:,1)), 'b')
legend("$\theta$ [deg]", 'Interpreter', 'latex')
title("Situation a")
grid

subplot(2,2,2)
plot(timePlot(:,2), rad2deg(theta_plot(:,2)), 'r')
legend("$\theta$ [deg]", 'Interpreter', 'latex')
title("Situation b")
grid

subplot(2,2,3)
plot(timePlot(:,3), rad2deg(theta_plot(:,3)), 'k')
legend("$\theta$ [deg]", 'Interpreter', 'latex')
title("Situation c")
grid

subplot(2,2,4)
plot(timePlot(:,4), rad2deg(theta_plot(:,4)), 'm')
legend("$\theta$ [deg]", 'Interpreter', 'latex')
title("Situation d")
grid
clc; clear all; close all;

m_1 = 2000; % kg
m_2 = 400; % kg
g = 9.81; % m/s^2
L_0 = 500/1000; % m
k = 100*10^3; % N/m
b = 1500; % Ns/m
h = 800/1000; % m
h_0 = 3100/1000; % m

x_1 = 500/1000; % m
x_2 = 1800/1000; % m

x_1Dot = 0; % m/s
x_2Dot = 0; % m/s

t = 0; % s
dt = 10^-5; % s
idx = 1; % Counter

simTime = 5; % s

while(t <= simTime)

    % Calculations
    Fk1 = k*(x_1-L_0);
    Fk3 = k*(h_0-x_2-h-L_0);
    Fk2 = k*(x_2-x_1-h-L_0);

    Fb1 = b*x_1Dot;
    Fb3 = -b*x_2Dot;
    Fb2 = b*(x_2Dot-x_1Dot);

    Gy1 = m_1*g;
    Gy2 = m_2*g;

    x_1DotDot = (Fk1 + Fb1 - Fk2 - Fb2 - Gy1)/m_1;
    x_2DotDot = (Fk3 + Fb3 - Fk2 - Fb2 - Gy2)/m_2;

    % Logging
    time_plot(idx) = t;
    x_1_plot(idx) = x_1;
    x_2_plot(idx) = x_2;
    % Time integration
    x_1Dot = x_1Dot + x_1DotDot * dt;
    x_2Dot = x_2Dot + x_2DotDot * dt;
    x_1 = x_1 + x_1Dot * dt;
    x_2 = x_2 + x_2Dot * dt;

    % Update variables
    t = t + dt;
    idx = idx + 1;
end

% subplot(2,1,1)
% plot(time_plot, x_1_plot)
% grid
% 
% subplot(2,1,2)
% plot(time_plot, x_2_plot)
% grid

figure
plot(time_plot, x_1_plot*1000)
hold on
plot(time_plot, x_2_plot*1000)
grid
%% Tutorial 1 & 2, P4
clc; clear all; close all;

k = 40*10^3; % N/m (kN/m converted to SI)
c = 500; % Ns/m
m = 100; % kg
g = 9.81; % m/s^2

simTime = 2; % s

F_0_a = 0; % N, force for situation a
F_0_bcd = 500; % N, force for sitations b, c and d

omega_p_a = 0; % rad/s, for situation a
omega_p_b = 10; % rad/s, for situation b
omega_p_c = 20; % rad/s, for situation c
omega_p_d = 30; % rad/s, for situation d

dt = 10^-4 % timestep
idx = 1; % index for counting
t = 0; % initialize time

y = 0; % from the problem y=0 is given
yDot = 0; % 

while t < simTime
    delta = y;
    deltaDot = yDot;

    F = F_0_bcd*sin(omega_p_d*t);
    Fk = k*delta;
    Fc = c*deltaDot;
    
    yDotDot = (F-Fk-Fc-m*g)/m;
   
    timePlot(idx) = t;
    yPlot(idx) = y;
    yDotPlot(idx) = yDot;
    yDotDotPlot(idx) = yDotDot;

    y = y+yDot*dt;
    yDot = yDot+yDotDot*dt;
    t = t+dt;
    idx = idx+1;
end

plot(timePlot, yPlot)
grid

yMax = max(yPlot)
yDotMax = max(yDotPlot)
yRMS = rms(yPlot)
yDotRMS = rms(yDotPlot)


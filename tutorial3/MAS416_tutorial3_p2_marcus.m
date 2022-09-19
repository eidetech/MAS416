clc; clear all; close all;

m1 = 100; % kg
m2 = 200; % kg

g = 9.81; % m/s^2

L0 = 200/1000; % m
k = 18*10^3; % N/m

b = 900; % N*s/m

x = 200/1000; % m
xDot = 0; % m/s

t = 0; % init time
dt = 10^-3; % time step
idx = 1; % init index
simTime = 5; % s, simulation time

m_eff = m1+m2; % calculate m_eff outside the loop

while t <= simTime

    delta = x-L0;
    deltaDot = xDot;
    Fk = delta*k;
    Fb = deltaDot*b;
    F_eff = -(-Fk-Fb+m2*g);

    xDotDot = -F_eff/m_eff;
    
    timePlot(idx) = t;
    xPlot(idx) = x;
    xDotPlot(idx) = xDot;
    
    x = x+xDot*dt;
    xDot = xDot+xDotDot*dt;
    
    t = t+dt;
    idx=idx+1;

end

subplot(1,2,1)
plot(timePlot, xPlot)
xlim([0 simTime])
subplot(1,2,2)
plot(timePlot, xDotPlot)
xlim([0 simTime])



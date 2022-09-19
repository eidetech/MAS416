clc; clear all; close all;

m1 = 100; % kg
m2 = 200; % kg

g = 9.81; % m/s^2

L0 = 200/1000; % m
k = 18*10^3; % N/m

b = 900; % N*s/m

x = 200/1000; % m
xDot = 0; % m/s

sim = forward_euler(5,x,xDot);

m_eff = m1+m2; % calculate m_eff outside the loop

while sim.t <= sim.simTime

    delta = sim.y-L0;
    deltaDot = sim.yDot;
    Fk = delta*k;
    Fb = deltaDot*b;
    F_eff = -(-Fk-Fb+m2*g);

    sim.yDotDot = -F_eff/m_eff;
    
   sim.time_integrate()

end

% sim.simulate()



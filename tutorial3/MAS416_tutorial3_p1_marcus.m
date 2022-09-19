clc; clear all; close all;

muk = 0.2;
v_tnh = 0.02;
m = 200;
theta = 30; % deg
theta_rad = deg2rad(theta); % rad
L0 = 50/1000; % m
k = 150*10^3; % N/m
b = 4000; % damping coeff
g = 9.81;

t = 0;
x = 150/1000;
xDot = 0;

simTime = 3; % s
dt = 10^-3;

idx = 1;

while t <= simTime
    delta = L0 - x;
    deltaDot = -xDot;
    if(delta >= 0)
        Fb = b * sqrt(delta) * deltaDot;
        Fk = k*delta;
    else
        Fb = 0;
        Fk = 0;
    end

    Fg = -m*g*sin(theta_rad);
    Ffr = -m*g*cos(theta_rad)*muk*tanh(xDot/v_tnh);

    xDotDot = (Fg + Fb + Fk + Ffr)/m;

    timePlot(idx) = t;
    xPlot(idx) = x*10^3;
    xDotPlot(idx) = xDot;
    xDotDotPlot(idx) = xDotDot;

    x = x + xDot*dt;
    xDot = xDot + xDotDot*dt;

    t = t+dt;
    idx = idx+1;

end

subplot(1,2,1)
plot(timePlot, xPlot)
subplot(1,2,2)
plot(timePlot, xDotPlot)

x_max = max(xPlot)
x_rms = rms(xPlot)

xDot_max = max(xDot)
xDot_rms = rms(xDot)


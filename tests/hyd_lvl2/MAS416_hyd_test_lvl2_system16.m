clc; clear all; close all;

% This is Hydraulic System number 16 . rho (density) = 875 kg/m^3 . beta (bulk modulus) = 1100 MPa . Minimum gauge pressure (vacuum) = -1 bar , Qs01 = 26 l/min , Cd1 = 0.64 , Ad1 = 2 mm^2 , Cd2 = 0.78 , Ad2 = 36 mm^2 , Cd3 = 0.57 , Ad3 = 1 mm^2 , Cd4 = 0.56 , Ad4 = 33 mm^2 , tRU1 = 243 milliSeconds , tH1 = 161 milliSeconds , tRD1 = 243 milliSeconds , d1 = 40 mm , dr1 = 20 mm , h01 = 911 mm , m1 = 1600 kg , d2 = 50 mm , dr2 = 35 mm , h02 = 1026 mm , m2 = 2800 kg , muk1 = 0.40 , vt1 = 10 mm/s , muk2 = 0.70 , vt2 = 10 mm/s , p1 (initial value) = 0 bar , p2 (initial value) = 0 bar , p3 (initial value) = 0 bar , x1 (initial value) = 456 mm , x1Dot (initial value) = 0 mm/s , x2 (initial value) = 513 mm , x2Dot (initial value) = 0 mm/s , simulation time = 647 milliSeconds . What is the maximum absolute value of the flow in orifice 1 [l/min] ?

rho = 875; % kg/m^3
beta = 1100*10^6; % Pa
gauge_min = -1*10^5; % Pa
Qs01 = 26/(60*10^3); % m^3/s
Cd1 = 0.64;
Ad1 = 2/10^6; % m^2
Cd2 = 0.78;
Ad2 = 36/10^6; % m^2
Cd3 = 0.57;
Ad3 = 1/10^6; % m^2
Cd4 = 0.56;
Ad4 = 33/10^6; % m^2

tRU1 = 243/1000; % s
tH1 = 161/1000; % s
tRD1 = 243/1000; % s

d1 = 40/1000; % m
dr1 = 20/1000; % m
h01 = 911/1000; % m
m1 = 1600; % kg
d2 = 50/1000; % m
dr2 = 35/1000; % m
h02 = 1026/1000; % m
m2 = 2800; % kg
g = 9.81; % m/s^2

A1 = pi/4*d1^2; % m^2
A2 = A1 - pi/4*dr1^2; % m^2
A3 = pi/4*d2^2; % m^2
A4 = A3 - pi/4*dr2^2; % m^2

muk1 = 0.4;
vt1 = 10/1000; % m/s
muk2 = 0.7;
vt2 = 10/1000; % m/s

p1 = 0;
p2 = 0;
p3 = 0;

x1 = 456/1000; % m
x1Dot = 0; % m/s
x2 = 513/1000; % m
x2Dot = 0; % m/s


simTime = 647/1000; % s
t = 0;
dt = 10^-5; % s
idx = 1;

while(t <= simTime)
    % Calculations

    if(t<tRU1)
        Qs1 = Qs01 * t/tRU1;
    elseif(t<=tRU1+tH1)
        Qs1 = Qs01;
    else
        tm = t-(tRU1+tH1);
        Qs1 = Qs01 * (1-(tm/tRD1));
    end

    % Q1 = Cd1*Ad1*sign(p1-p3)*sqrt(2/rho*abs(p1-p3));
    Q1 = Cd1*Ad1*sign(p2-p1)*sqrt(2/rho*abs(p2-p1));
    Q2 = Cd2*Ad2*sign(p1-0)*sqrt(2/rho*abs(p1-0));
    Q3 = Cd3*Ad3*sign(p2-p3)*sqrt(2/rho*abs(p2-p3));
    Q4 = Cd4*Ad4*sign(p3-0)*sqrt(2/rho*abs(p3-0));

    % p1Dot = beta/V1 * (Q2-Q1);

    V1 = A1*x1;
    V2 = A2*(h01-x1);
    V3 = A3*x2;
    V4 = A4*(h02-x2);

    p1Dot = beta/V1 * (Q1-Q2-A1*x1Dot);
    p2Dot = beta/(V2+V4) * (Qs1-Q1-Q3+A2*x1Dot+A4*x2Dot);
    p3Dot = beta/V3 * (Q3-Q4-A3*x2Dot);

    mu1 = muk1*tanh(x1Dot/vt1);
    mu2 = muk2*tanh(x2Dot/vt2);

    Ffr1 = m1*g*mu1;
    Ffr2 = m2*g*mu2;

    sumF1 = (p1*A1-p2*A2)-Ffr1;
    sumF2 = (p3*A3-p2*A4)-Ffr2;

    % F = ma
    x1DotDot = sumF1/m1;
    x2DotDot = sumF2/m2;

    % Logging
    tplt(idx) = t;
    Qs1plt(idx) = Qs1*(10^3*60);
    Q1plt(idx) = Q1*10^3*60;
    p1plt(idx) = p1/10^5;
    p2plt(idx) = p2/10^5;
    p3plt(idx) = p3/10^5;

    % Time integration
    x1Dot = x1Dot + x1DotDot * dt;
    x1 = x1 + x1Dot * dt;
    x2Dot = x2Dot + x2DotDot * dt;
    x2 = x2 + x2Dot * dt;

    p1 = p1 + p1Dot * dt;
    if p1 < gauge_min
        p1 = gauge_min;
    end

     p2 = p2 + p2Dot * dt;
    if p2 < gauge_min
        p2 = gauge_min;
    end

    p3 = p3 + p3Dot * dt;
    if p3 < gauge_min
        p3 = gauge_min;
    end

    % Update variables
    t = t + dt;
    idx = idx + 1;
end

plot(tplt, Q1plt)
legend("Q1 [L/min]")

figure
plot(tplt,p1plt, 'b')
hold on
plot(tplt,p3plt, 'k')
legend("p1 [bar]","p3 [bar]")

figure
plot(tplt,p2plt, 'r')
legend("p2 [bar]")
% plot(tplt, Qs1plt)


disp("What is the maximum absolute value of the flow in orifice 1 [l/min] ?")
Q1max = max(Q1plt)
Q1min = min(Q1plt)
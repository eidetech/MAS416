%% Tutorial 1 & 2, P6
clc; clear all; close all;

% Known constants
A = 0.2; % m
B = 0.1; % m/s
L_0 = 0.1; % m
k = 1000; % N/m

F_0 = 500; % N
v_0 = 0.01; % m/s

xDot = 0; % m/s
x = 0.1; % m

Ffr = F_0 * tanh(xDot/v_0); % N

m = 300; % kg
theta = deg2rad(30); % rad


simTime = 25; % s
t = 0; % s
idx = 1; % index/counter
dt = 10^-4; % timestep

while t<simTime

x_0 = A+B*t;

delta = x_0 - x - L_0;

if (delta >= 0)
F_k = k*delta;
elseif(delta < 0)
F_k = 0;
end



end

clc; close all; clear all;

% Tutorial 1, problem 1a)
dt = 10^-5;

A = [1 2 3];
f = 0.5;

interval = [5 10 15];


t = 0;
idx = 1;



while t <= interval(1)
    y = A(1)*sin(2*pi*f*t);

    timePlot(idx) = t;
    yPlot(idx) = y;

    t = t+dt;
    idx = idx+1;
end

while t >= interval(1) && t <= interval(2)
    y = A(2)*sin(2*pi*f*t);

    timePlot(idx) = t;
    yPlot(idx) = y;

    t = t+dt;
    idx = idx+1;
end

while t > interval(2) && t < interval(3)
    y = A(3)*sin(2*pi*f*t);

    timePlot(idx) = t;
    yPlot(idx) = y;

    t = t+dt;
    idx = idx+1;
end

plot(timePlot, yPlot, 'LineWidth', 2)
grid on

maxMag = max(yPlot)
RMSval = rms(yPlot)

% Tutorial 1, problem 1b)
clear all;

dt = 10^-5;
A = 1;

t = 0;
idx = 1;
y = 0

while y <= 10
    if(t <= 2)
        B = 1-t;
    elseif(t > 2)
        B = 0;
    end
    y = A*t^2 + B;
    t = t + dt;

    timePlot(idx) = t;
    yPlot(idx) = y;

    t = t+dt;
    idx = idx+1;
end

plot(timePlot, yPlot, 'LineWidth', 2)
grid on

% Tutorial 1, problem 2a)
clear all; close all;

interval = [0 1];

y = 0;
idx = 1
dt = 10^-3
t = 0;

while t <= interval(2)

yDot = (3-y)/(0.2);

timePlot(idx) = t;
yPlot(idx) = y;
yDotPlot(idx) = yDot;

y = y+yDot*dt;
t = t+dt;
idx=idx+1;

end

plot(timePlot, yPlot, 'LineWidth', 2)

% Tutorial 1, problem 2b)
clear all; close all;
y = 0;
yDot = 0;

idx = 1;
dt = 10^-3;
t = 0;

while t <= 1

yDotDot = 100*(3-y) - 12*yDot;

timePlot(idx) = t;
yPlot(idx) = y;
yDotPlot(idx) = yDot;
yDotDotPlot(idx) = yDotDot;

y = y+yDot*dt;
yDot = yDot + yDotDot*dt;
idx = idx+1;
t = t+dt;
end

plot(timePlot, yPlot)
grid on
hold on
plot(timePlot, yDotPlot)

maxMag_y = max(yPlot)
maxMag_yDot = max(yDotPlot)
RMS_y = rms(yPlot)
RMS_yDot = rms(yDotPlot)

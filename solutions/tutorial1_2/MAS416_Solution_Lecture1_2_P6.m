close all; %Close any open figure windows
clear; %Clear memory
%Model data, SI-units
g=9.81; %Gravitational acceleration
A=0.2; %Initial position spring
B=0.1; %Cst velocity spring rate
L0=100/1e3; %Undeformed length spring
k=1000; %Spring stiffness
F0=500; %Friction force max value
v0=0.01; %Friction force curve velocity
m=300; %Mass
theta=30*pi/180; %Incline angle, radians
%Initial data
x=100/1e3; %Initial position of mass
xDot=0; %Initial velocity of mass
%Time and counter data
i=1;
t=0;
tEnd=25;
tStep=1e-3;
%Time integration
while t<tEnd
    %Computations
    x0=A+B*t; %Spring position
    Delta=x0-x-L0; %Spring elongation
    if Delta>0 %If spring is stretched
        Fk=k*Delta; %Spring force
    else %If spring is compressed
        Fk=0; %No compression force
    end;
    Ffr=F0*tanh(xDot/v0); %Friction force
    xDotDot=(Fk-Ffr-m*g*sin(theta))/m; %Mass acceleration
    %Save plot data
    tPlot(i)=t; %Save time [s]
    xPlot(i)=x*1e3; %Save x as [mm]
    %Time integrate
    i=i+1; %Increment counter
    t=t+tStep; %Update time
    x=x+tStep*xDot; %Update position
    xDot=xDot+tStep*xDotDot; %Update velocity
end;
plot(tPlot,xPlot); %Plot position vs time
grid; %Add grid lines
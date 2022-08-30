close all; %Close any open figure windows
clear; %Clear memory
%Model data, SI-units
m1=2000; %Mass 1
m2=400; %Mass 2
g=9.81; %Gravity
L0=500/1e3; %Undeformed spring length
k=100e3; %Spring stiffness
b=1500; %Damping constant
h=800/1e3; %Height of mass
h0=3100/1e3; %Height of entire system
%Initial data
x1=500/1e3; %Initial position mass 1
x2=1800/1e3; %Initial position mass 2
x1Dot=0; %Initial velocity mass 1
x2Dot=0; %Initial velocity mass 2
%Time and counter data
t=0;
tEnd=5;
tStep=1e-4;
n=round(tEnd/tStep); %Number of timesteps
%Time integration
for i=1:n
    %Compute elongation of all springs
    Delta1=x1-L0;
    Delta2=x2-(x1+h)-L0;
    Delta3=h0-(x2+h)-L0;
    %Compute all spring forces, positive if stretched
    Fk1=k*Delta1;
    Fk2=k*Delta2;
    Fk3=k*Delta3;
    %Compute elongation rate of all dampers
    Delta1Dot=x1Dot;
    Delta2Dot=x2Dot-x1Dot;
    Delta3Dot=-x2Dot;
    %Compute all damping forces, positive if stretching
    Fb1=b*Delta1Dot;
    Fb2=b*Delta2Dot;
    Fb3=b*Delta3Dot;
    %Compute acceleration of both masses
    x1DotDot=(-Fk1-Fb1+Fk2+Fb2-m1*g)/m1; %Mass 1 acceleration
    x2DotDot=(-Fk2-Fb2+Fk3+Fb3-m2*g)/m2; %Mass 2 acceleration
    %Save plot data
    tPlot(i)=t;
    x1Plot(i)=x1*1e3;
    x2Plot(i)=x2*1e3;
    %Time integrate
    t=t+tStep; %Update time
    x1=x1+x1Dot*tStep; %Update x1
    x2=x2+x2Dot*tStep; %Update x2
    x1Dot=x1Dot+x1DotDot*tStep; %Update x1Dot
    x2Dot=x2Dot+x2DotDot*tStep; %Update x2Dot
end;
plot(tPlot,x1Plot); %Plot x1 vs time
hold on;
plot(tPlot,x2Plot,'r'); %Plot x2 vs time
grid;
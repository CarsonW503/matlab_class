%Homework #7
%Carson Williams

%You have to send in to ODE45 the 'function name', 
%the domain range, and a starting value. You do NOT pick a dx.

clear
clc

%defining knowns:
theta = 40;
gamma = [0 0.05 0.1 0.2];
V_init = 180;    %m/s
g = 9.8; %m/s^2

%
% y1 = x; %horizontal position (x)
% y2 = y; %vertical position (y)
% y3 = u; %horizontal velocity (dx/dt)
% y4 = v; %vertical velocity (dy/dt)
% V = abs(sqrt(y3^2 + y4^2)); %Velocity magnitude

%defining intial conditions:
X10 = 0;
X20 = V_init*cosd(theta);
Y10 = 0;
Y20 = V_init*sind(theta);
X0 = [X10 X20];
Y0 = [Y10 Y20];

%vector of intitial conditions:
%YY0 = [X10 Y10 X20 Y20];

%domain:
tspan = [0:25];

%EQs:
u = @(x,y,gamma) [y(2); -gamma*]

%output:
[t,y] = ode45(@trajectory, tspan, YY0, [], C);

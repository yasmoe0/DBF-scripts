%% Take-off Distance
clear
clc
close all
%=======================================================================
%% Inputs and constants for Takeoff Distance

g = 32.2; %gravity in ft/s
u = 0.68; %asphalt friction coefficient (Rubber on asphalt)
rho = 0.002321;

b = 6; 

disp("Gravity = 32.2 ft/s^2")
disp("Ground Frication Coefficient = 0.68")
disp("Air Density = 0.002321")

w = input("Input Aircraft Weight [lb] = ");
ar = input("Input Aspect Ratio = ");
clmax = input("Input Aircraft Lift-Coffiecent = ");
vto = input("Input Max Velocity = ");

v = 0.7*vto;
s = (b^2)/ar;
L = 0.5*rho*v^2*s*clmax;

cd = 0.03 + (clmax)^2/(3.14*ar*0.9);
D = 0.5 * rho * v^2 * s * cd;

T = clmax * w;

STO = (1.69*w^2)/(g*rho*s*clmax*(T-(D+u*(w-L))));

fprintf('Take-off Distance = %5.2f [ft]',STO)
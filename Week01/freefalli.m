function freefalli
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

g = 9.81;
m = input('Mass(kg):');
cd = input('Drag Coefficient(kg/m):');
t = input('Time(s):');
disp('Velocity (m/s):');
disp(sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t))
minusvelocity = -sqrt(g*m/cd)*tan(sqrt(g*cd/m)*t);
fprintf('The velocity is %8.4f m/s\n', minusvelocity);


end


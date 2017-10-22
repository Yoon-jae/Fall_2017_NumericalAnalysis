% Problem 12.2
clear; clc;
A = [10 -2;
     -3 12];
b = [8;
     9];

disp('Problem 12.2');
[x, ea, iter] = GaussSeidelR(A, b, 1.2, 0.1, 50)

% Ex 12.2b
A = [0.8 -0.4 0;
     -0.4 0.8 -0.4;
     0 -0.4 0.8];
b = [41;
     25;
     105];

disp('Ex 12.2b');
[x, ea, iter] = GaussSeidelR(A, b, 1.2, 0.05, 50)
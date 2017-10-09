g = 9.81; z0 = 100; v0 = 55; m = 80; c = 15;
fx = @(t) z0 + m / c * (v0 + m * g / c) ...
    * (1 - exp(-c / m * t)) - m * g / c * t;

[xopt , fxopt] = gold_max(fx, 0, 8, 0.0001, 50);
disp("xopt : " + xopt);
disp("fxopt : " + fxopt);
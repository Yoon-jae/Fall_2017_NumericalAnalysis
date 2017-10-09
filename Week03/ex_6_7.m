fx = @(x) x .^ 3 - 6 * x .^ 2 + 11 * x - 6.1;
modified_secant(fx, 3.5, 0.01, 0.001, 3)

f = @(x) x^2 / 10 - 2 * sin(x);
[x, fx] = secondary_interpolation(f, 0, 4, 0.0001, 50);
disp('x : ' + x);
disp('fx : ' + fx);

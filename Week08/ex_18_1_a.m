x = [1, 2, 2.5, 3, 4, 5];
y = [1, 5, 7, 8, 2, 1];
xx = linspace(1, 5);
yy = natural_spline(x, y, xx);
plot(x, y, 'o', xx, yy);
x = [3, 4.5, 7, 9];
y = [2.5, 1, 2.5, 0.5];

xx = linspace(3, 9);
yy = natural_spline(x, y, xx);

plot(x, y, 'o', xx, yy);
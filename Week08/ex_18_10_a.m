x = [0, 2, 4, 7, 10, 12];
y = [20, 20, 12, 7, 6, 6];
xx = linspace(0, 12);
yy = spline(x, y, xx);
plot(x, y, 'o', xx, yy);

result = spline(x, y, 1.5)
x = [0, 2, 4, 7, 10, 12];
y = [20, 20, 12, 7, 6, 6];

xx = linspace(0, 12);
yc = [0 y 0];

yyc = spline(x, yc, xx);
plot(x, y, 'o', xx, yyc);

result = spline(x, yc, 1.5)
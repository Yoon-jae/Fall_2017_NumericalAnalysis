function [a] = linear_regression_zero(x, y)
    n = length(x);
    x = x(:); y = y(:);
    xy = sum(x .* y); xx = sum(x .* x);
    a = xy / xx;
    
    xp = linspace(0, max(x));
    yp = a * xp;
    plot(x, y, 'o', xp, yp);
    grid on
end
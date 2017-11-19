function [a, sy_x, r2] = linear_regression(x, y)
    n = length(x);
    x = x(:); y = y(:);
    sx = sum(x); sy = sum(y);
    sx2 = sum(x .* x); sy2 = sum(y .* y); sxy = sum(x .* y);
    a(1) = (n * sxy - sx * sy) / (n * sx2 - sx^2); % 기울기
    a(2) = sy / n - a(1) * sx / n; % y절편
    r2 = ((n * sxy - sx * sy) / sqrt(n * sx2 - sx^2) ...
        / sqrt(n * sy2 - sy^2)) ^ 2;
    sr = sum((y - a(2) - a(1) * x) .* (y - a(2) - a(1) * x));
    sy_x = sqrt(sr / (n - 2));
   
    xp = linspace(min(x), max(x));
    yp = a(1) * xp + a(2);
    plot(x, y, 'o', xp, yp);
    grid on
end
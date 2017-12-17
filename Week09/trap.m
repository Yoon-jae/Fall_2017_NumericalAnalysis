function I = trap(func, a, b, n)
    x = a;
    h = (b - a) / n;
    s = func(a);
    for i = 1 : n - 1
        x = x + h;
        s = s + 2 * func(x);
    end
    s = s + func(b);
    I = (b - a) * s / (2 * n);
end
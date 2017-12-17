f = @(x) 0.2 + 25 * x - 200 * x ^ 2 ...
    + 675 * x ^ 3 - 900 * x ^ 4 + 400 * x ^ 5;

q = romberg_intg_upper(f, 0, 0.8, 0.05, 5)
q = romberg_intg_lower(f, 0, 0.8, 0.05, 5)

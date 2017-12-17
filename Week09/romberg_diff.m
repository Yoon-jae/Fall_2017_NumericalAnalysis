function d = romberg_diff(func, x, es, maxit)
    n = 1;
    D(1, 1) = diff(func, x, n);
    iter = 0;
    ea = 100;
    while iter < maxit
        iter = iter + 1;
        n = 2 ^ iter;
        D(iter + 1, 1) = diff(func, x, n);
        for k = 2:iter + 1
            j = 2 + iter - k;
            D(j, k) = (4^(k - 1) * D(j + 1, k - 1) - D(j, k - 1)) ...
                / (4^(k - 1) - 1);
        end
        
        if D(1, tier + 1) ~= 0
            ea = abs(((D(1, iter + 1) - D(2, iter)) / D(1, iter + 1))) * 100;
        end
        if ea <= es
            break;
        end
    end
    d = D(1, iter + 1);
end

function d = differential(func, x, n)
    e = x/n;
    a = x - e; b = x + e;
    d = (func(b) - func(a)) / (b - a);
end
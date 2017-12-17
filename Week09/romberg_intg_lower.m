function q = romberg_intg(func, a, b, es, maxit)
    n = 1;
    I(1, 1) = trap(func, a, b, n);
    iter = 0;
    while iter < maxit
        iter = iter + 1;
        n = 2 ^ iter;
        I(iter + 1, 1) = trap(func, a, b, n);
        j = iter + 1;
        for k = 2:iter + 1  
            I(j, k) = (4^(k - 1) * I(j, k - 1) - I(j - 1, k - 1)) / (4^(k - 1) - 1);
        end
        ea = abs((I(j, iter + 1) - I(j, iter)) / I(j, iter + 1)) * 100;
        if ea <= es
            break;
        end
    end
    q = I(j, iter + 1);
end

function root = modified_secant(func, x_i, delta, es, max_it)
    iter = 0;
    while 1
        x_old = x_i;
        x_i = x_i - delta * x_i * func(x_i) ...
            / (func(x_i + delta * x_i) - func(x_i));
        disp('iter : ' + iter);
        iter = iter + 1;
        if x_i ~= 0
            ea = abs((x_i - x_old) / x_i) * 100;
        end
        disp('ea : ' + ea);
        if ea <= es | iter >= max_it
            break
        end
    end
    root = x_i;
end

function root = secant(func, x_i_old, x_i, es, max_it)
    iter = 0;
    while 1
        x_i_new = x_i - func(x_i) * (x_i_old - x_i) ...
            / (func(x_i_old) - func(x_i));
        disp("iter : " + iter);
        iter = iter + 1;
        if x_i_new ~= 0
            ea = abs((x_i_new - x_i) / x_i_new) * 100;
        end
        disp("ea : " + ea);
        if ea <= es || iter >= max_it
            break
        end
        x_i_old = x_i;
        x_i = x_i_new;
    end
    root = x_i_new;
end
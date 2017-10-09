function [root, fx, ea, iter] = false_position(func, xl, xu, es, max_it)
    sign = func(xl) * func(xu);
    if sign > 0
        error("f(xl) * f(xu) value must be negative");
    end
    iter = 0; xr = xl;
    while 1
        xr_old = xr;
        fl = func(xl); fu = func(xu);
        xr = xu - fu * (xl - xu) / (fl - fu);
        disp("xr : " + xr);
        disp("iter : " + iter);
        iter = iter + 1;
        if xr ~= 0
            ea = abs((xr - xr_old) / xr) * 100;
        end
        
        sign = fl * func(xr);
        if sign < 0
            xu = xr;
        elseif sign > 0
            xl = xr;
        else
            ea = 0;
        end
        disp("ea : " + ea);
        if ea <= es | iter >= max_it
            break
        end 
    end
    root = xr;
    fx = func(xr);
end
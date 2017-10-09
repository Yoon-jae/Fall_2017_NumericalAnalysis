function [x, fx] = gold_max(f, xl, xu, es, max_it)
    phi = (1 + sqrt(5)) / 2;
    iter = 0;
    while (1)
       d = (phi - 1) * (xu - xl);
       x1 = xl + d;
       x2 = xu - d;
       if f(x1) > f(x2)
           xopt = x1;
           xl = x2;
       else
           xopt = x2;
           xu = x1;
       end
       iter = iter + 1;
       disp('iter : ' + iter);
       disp('xopt : ' + xopt);
       if xopt ~= 0
           ea = (2 - phi) * abs((xu - xl) / xopt) * 100;
       end
       disp('ea : ' + ea);
       if ea <= es | iter >= max_it
           break
       end
    end
    x = xopt;
    fx = f(xopt);
end

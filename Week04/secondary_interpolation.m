function [xopt, fxopt] = secondary_interpolation(f, xl, xu, es, max_it)
    iter = 0;
    x1 = xl; x3 = xu;
    x2 = (x1 + x3) / 2;
    f1 = f(x1); f2 = f(x2); f3 = f(x3);
    if f2 < f1 & f2 < f3
       xoptold = x2;
       while (1)
          xopt = x2 - 0.5 * ((x2 - x1) ^ 2 * (f2 - f3) - (x2 -x3) ^ 2 ...
              * (f2 - f1)) / ((x2 -x1) * (f2 - f3) - (x2 - x3) * (f2 - f1));
          fxopt = f(xopt);
          iter = iter + 1;
          if xopt > x2
              x1 = x2;
              f1 = f2;
          else
              x3 = x2;
              f3 = f2;
          end
          x2 = xopt; f2 = fxopt;
          if xopt ~= 0
              ea = abs((xopt - xoptold) / xopt) * 100;
          end
          xoptold = xopt;
          disp("iter : " + iter);
          disp("xopt : " + xopt);
          disp("fxopt : " + fxopt);
          if ea <= es | iter >= max_it
              break
          end
       end
    else
       error("There is no optimal value in the range."); 
    end
end
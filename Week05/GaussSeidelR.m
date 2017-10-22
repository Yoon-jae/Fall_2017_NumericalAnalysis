function [x, ea, iter] = GaussSeidelR(A, b, lambda, es, maxit)
    [m, n] = size(A);
    if m ~= n
       erorr('Matirx must be square(NxN)');
    end
    if isempty(lambda)
        lambda = 1;
    end
    C = A;
    for i = 1:n
        C(i, i) = 0;
        x(i) = 0;
    end
    x = x';
    for i = 1:n
        C(i, 1:n) = C(i, 1:n) / A(i, i);
        d(i) = b(i) / A(i, i);
    end
    iter = 0;
    while (1)
        xold = x;
        for i = 1:n
            x(i) = d(i) - C(i, :) * x;
            x(i) = lambda * x(i) + (1 - lambda) * xold(i);
            if x(i) ~= 0
                ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
            end
        end
        iter = iter + 1;
        max_ea = max(ea);
        if max_ea <= es | iter >= maxit
            break
        end
    end
end
function [eval, evect] = powereig(A, es, maxit)
    if nargin < 2 | isempty(es)
        es=0.0001;
    end
    if nargin < 3 | isempty(maxit)
        maxit=50;
    end
    n = length(A);
    evect = ones(n, 1); eval = 1;
    iter = 0; ea = 100;
    while (1)
       evalold = eval;
       evect = A * evect;
       eval = max(abs(evect));
       evect = evect ./ eval;
       iter = iter + 1;
       if eval ~= 0
           ea = abs((eval - evalold) / eval) * 100;
       end
       if ea <= es | iter >= maxit
           break
       end
    end
end
function x = penta_diagonal(A, b)
    [m, n] = size(A);
    if m ~= n | m ~= length(b)
       error('Matrix must be square(NxN) and vector length must be N'); 
    end
    
    % Band Setting
    d = [0; 0; diag(A, -2)];
    e = [0; diag(A, -1)];
    f = diag(A);
    g = diag(A, 1);
    h = diag(A, 2);
    
    del = zeros(n, 1);
    eps = zeros(n-1, 1);
    gam = zeros(n-2, 1);
    alp = zeros(n, 1);
    
    c = zeros(n, 1);
    z = zeros(n, 1);
    
    del(1) = f(1);
    eps(1) = g(1) / del(1);
    gam(1) = h(1) / del(1);
    alp(2) = e(2);
    del(2) = f(2) - alp(2) * eps(1);
    eps(2) = (g(2) - alp(2) * gam(1)) / del(2);
    gam(2) = h(2) / del(2);
    
    for k = 3:n-2
        alp(k) = e(k) - d(k) * eps(k-2);
        del(k) = f(k) - d(k) * gam(k-2) - alp(k) * eps(k-1);
        eps(k) = (g(k) - alp(k) * gam(k-1)) / del(k);
        gam(k) = h(k) / del(k);
    end
    
    alp(n-1) = e(n-1) - d(n-1) * eps(n-3);
    del(n-1) = f(n-1) - d(n-1) * gam(n-3) - alp(n-1) * eps(n-2);
    eps(n-1) = (g(n-1) - alp(n-1) * gam(n-2)) / del(n-1);
    alp(n) = e(n) - d(n) * eps(n-2);
    del(n) = f(n) - d(n) * gam(n-2) - alp(n) * eps(n-1);
    
    c(1) = b(1) / del(1);
    c(2) = (b(2) - alp(2) * c(1)) / del(2);
    for k = 3:n
       c(k) = (b(k) - d(k) * c(k-2) - alp(k) * c(k-1)) / del(k); 
    end
    
    % Back substitution
    x(n) = c(n);
    x(n-1) = c(n-1) - eps(n-1) * x(n);
    for k = n-2:-1:1
       x(k) = c(k) - eps(k) * x(k+1) - gam(k) * x(k+2); 
    end     
end
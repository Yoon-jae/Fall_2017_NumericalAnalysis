function U = cholesky(A)
    [m, n] = size(A);
    if m ~= n
       erorr('Matirx must be square(NxN)');
    end
    for i = 1:n
        s = 0;
        for k = 1:-1
            s = s + U(k, i) ^ 2;
        end
        U(i, i) = sqrt(A(i, i) - s);
        for j = i+1:n
            s = 0;
            for k = 1:i-1
                s = s + U(k, i) * U(k, j);
            end
            U(i, j) = (A(i, j) - s) / U(i, i);
        end
    end
end
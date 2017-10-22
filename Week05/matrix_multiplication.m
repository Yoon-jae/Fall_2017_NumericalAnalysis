function X = matrix_multiplication(A, B)
    if nargin < 2
        error('At least two input matrices are requirements');
    end
    [n, m] = size(A); [m2, l] = size(B);
    if m ~= m2
        error('The dimension of inner matrix must match');
    end
    X = zeros(n, l);
    for i = 1 : n
        for j = 1 : l
           for k = 1 : m
               X(i, j) = X(i, j) + A(i, k) * B(k, j);
           end
        end
    end
end
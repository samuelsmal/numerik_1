%% f_7_lufact: LU Factorization of a square band matrix
% A Square band matrix
% k bandwidth of A

% Computational cost is O(d) with d = bandwith of A
function [L, U] = f_7_lufact(A, k)
    
    [d, dd] = size(A);

    if (d ~= dd)
        error('A must be a square matrix.');
    end

    L = zeros(d,d);
    U = zeros(d,d);
    
    for m = 1 : d
        L(m, m) = 1;
        U(m, m) = A(m, m);
        
        for i = m + 1 : min(m + k, d)
            L(i, m) = A(i, m) / U(m, m);
            U(m, i) = A(m, i);
        end
        
        for i = m + 1 : min(m + k, d)
            for j= m + 1 : min(m + k, d)
                A(i, j) = A(i, j) - L(i, m) * U(m, j);
            end
        end
    end
end
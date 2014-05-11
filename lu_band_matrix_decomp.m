%%  LU_BAND_MATRIX_DECOMP LU Factorization of a square band matrix
%       [L, U, ops] = lu_band_matrix_decomp(A) returns the decomp of A and the number of operations needed
function [lower_diag, upper_diag, num_ops] = lu_band_matrix_decomp(A)
    
    [size_a, size_a_col] = size(A);

    if size_a ~= size_a_col
        error('A must be a square matrix.');
    end

    % Find the bandwidth
    bandwidth = @(vec) find(vec ~= 0, 1, 'last') - 1;
    right_bandwidth = bandwidth(A(1, :));
    left_bandwidth  = bandwidth(A(:, 1));

    temp_a = A;

    lower_diag = eye(size_a);
    ops = 0;
    
    for k = 1 : n - 1
        if abs(temp_a(k, k)) <= eps
            error(['*** The LU decomposition is aborted.',10, ...
                   '*** Because the matrix doesn''t permit it.']);
        end

        % There are only zero's below i+q in each column.
        for i = (k + 1) : min(n, k + q) 
            multiplier = temp_a(i, k) / temp_a(k, k);
            L(i, k) = multiplier;

            temp_a(i, k) = 0;

            ops = ops + 1;
            for j = (k + 1) : min(n, k + p)
                temp_a(i, j) = temp_a(i, j) - multiplier * temp_a(k, j);
                ops = ops + 2;
            end
        end
    end

    upper_diag = temp_a;
end
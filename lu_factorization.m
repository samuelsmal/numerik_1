%% LU_FACTORIZATION: lu factorization
% 	[L, U, x] = lu_factorization(A, b) returns the decomposition of A along the solution to the linear system Ax = b
function [lower_triangle, upper_triangle, solution] = lu_factorization(A, b)

	[size_a, size_a_col] = size(A);

	if size_a ~= size_a_col
		error('*** A must be a square matrix')
	end

	if size_a ~= length(b)
		error('*** The dimension of be doesn''t match that of A.');
	end

	temp_a = A;
    temp_b = b;

    solution = zeros(n,1);

    lower_triangle = eye(n);

    for k = 1 : size_a - 1
        % If the entry is smaller than the machine precision
        if abs(temp_a(k, k)) <= eps
            error(['*** The LU decomposition is aborted.',10, ...
                   '*** Because the matrix doesn''t admit it.']);
        end

        for i = (k + 1) : size_a
            multiplier = temp_a(i, k) / temp_a(k, k);
            lower_triangle(i, k) = multiplier;

            temp_a(i,k) = 0;

            for j = (k + 1) : size_a
                temp_a(i, j) = temp_a(i, j) - multiplier * temp_a(k, j);
            end

            temp_b(i) = temp_b(i) - multiplier * temp_b(k);
        end
    end

    upper_triangle = temp_a;
    
    % Backpropagation
    solution(size_a) = temp_b(size_a) / U(size_a, size_a);

    for k = (size_a - 1) : (-1) : 1
        x(k) = temp_b(k);

        for j = (k + 1) : size_a
            x(k) = x(k) - x(j) * upper_triangle(k, j);
        end

        x(k) = x(k) / upper_triangle(k, k);
    end

end

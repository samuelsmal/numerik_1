%% lu_factorization: lu factorization 
function [L, U, x] = lu_factorization(A, b)

	length_b = length(b);

	% Check constraints

	% if (size(A) ~= size(A'))
	% 	error('A is not a square matrix!')
	% end

	[a_row a_col] = size(A);
	if (a_row != a_col)
		error('A is not a square matrix!');
	end

	if (a_row ~= length_b)
		error('Dimensions of A and b must be the same!');
	end
	

	for i = 1:length_b
		if ( det(A(1:i, 1:i))==0)
			error('A does not admit to LU factorization!')
		end
	end

	L = eye(length_b);
	U = A;

	for i = 1:length_b
		for j = i:(length_b - 1)
			l = -U(j + 1, i) / U(i, i);

			for k = i:length_b
				U(j + 1, k) = U(j + 1, k) + l * U(i, k);
			end

			L(j + 1, i) = -l;
		end
	end

	x = U \ (L \ b);

end

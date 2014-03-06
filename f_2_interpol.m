function[p, coeffs] = f_2_interpol(data_x, data_y, x_0, type)
% F_2_INTERPOL Evaluates the interpolation polynomial at the point x_0.
%
% f_2_interpol(data_x, data_y, x_0, type) Evaluates the interpolation polynomial 
% defined through the given data points. The method (given through 'type') 
% can be either [Lagrange | lagrange] or [Newton | newton]
	if length(data_x) ~= length(data_y)
		error('Data point vectors have not the same length!');
	end

	if strcmp(type, 'Newton') || strcmp(type, 'newton')
		[p, coeffs] = interpol_newton(data_x, data_y, x_0);
	elseif strcmp(type, 'Lagrange') || strcmp(type, 'lagrange')
		[p, coeffs] = interpol_lagrange(data_x, data_y, x_0);
	else
		error('The given type is not supported');
	end
end

%%%%%%%%%%%%%%%%%%%%%
% Local functions
%%%%%%%%%%%%%%%%%%%%%


%
% BEGIN NEWTON
%
function coeffs = newton_weights(data_x, data_y)
	% Idea taken from the last year's script.
	n = length(data_x);

	coeff_matrix = zeros(n, n);

	coeff_matrix(:,1) = data_y;

	for i = 2:n
		for j = 2:i
			coeff_matrix(i, j) = (coeff_matrix(i, j-1) - coeff_matrix(i-1, j-1))/...
				(data_x(i) - data_x(i - j + 1));
		end
	end

	coeffs = diag(coeff_matrix);
end


function [support] = eval_support(data_x, x_0, vector_length)
	support = ones(vector_length, length(x_0));

	for i = 2:vector_length
		support(i,:) = support(i - 1,:) .* (x_0 - data_x(i - 1));
	end
end


function [p, coeffs] = interpol_newton(data_x, data_y, x_0)
	n = length(data_x);
	p = zeros(1, length(x_0));

	coeffs = newton_weights(data_x, data_y);
	support = eval_support(data_x, x_0, n);

	for i = 1:n
		p = p + coeffs(i) .* support(i,:);
	end
end

%
% END NEWTON
%

%
% BEGIN LAGRANGE
%

function [basis] = lagrange_basis(data_x, x_0, vector_length)
	basis = ones(vector_length, length(x_0));

	for i = 1:vector_length
		for j = 1:vector_length
			if (i ~= j)
				basis(i,:) = basis(i,:) .* (x_0 - data_x(j)) /... 
					(data_x(i) - data_x(j));
			end
		end
	end
end

function [p, coeffs] = interpol_lagrange(data_x, data_y, x_0)
	n = length(data_x);

	coeffs = lagrange_basis(data_x, x_0, n);

	p = 0;

	for i = 1:n 
		p = p + data_y(i).*coeffs(i,:);
	end
end

%
% END LAGRANGE
%
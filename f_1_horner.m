function [y] = f_1_horner(coefficients, x_0)
% F_1_HORNER evaluate a polynomial on point x_0 using Horner's method.
	y = zeros(1, length(x_0));
	for i = 1:length(coefficients)
		y = coefficients(i) + x_0 .* y;
	end
end

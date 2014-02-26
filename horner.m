function [y] = horner(coefficients, x_0)
% HORNER evaluate a polynomial on point x_0.
	y = coefficients(1);
	for i = 2:length(coefficients)
		y = coefficients(i) + x_0 * y;
	end
end

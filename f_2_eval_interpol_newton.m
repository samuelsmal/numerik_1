function [y] = f_2_eval_interpol_newton(coeffs, support_points, x_0)
% F_2_EVAL_INTERPOL_NEWTON Evaluates the interpolation polynomial 
% in Newton's form using an Horner's type algorithm.	
% coeffs:         The coefficients of the generated polynomial.
% support_points: The original support points.
% x_0:            The point to evaluate.
	y = coeffs(end);
	for i = length(coeffs) - 1:-1:1
		y = y * (x_0 - support_points(i)) + coeffs(i);
	end
end

function [n, m] = f_1_ops_counter(coeffs, x)
% F_1_OPS_COUNTER counts the required operations used to evaluate a polynomial.
%
% f_1_ops_counter(coeffs, x) returns first the number using the horner method
% and second the number using the naive (extra naive, powers are calculated
% by repeated multiplication) way.
	n = 0;
	m = 0;

	if x ~= 0
		% Horner
		% Each term requires one addition and one multiplication.
		for i = 2:length(coeffs)
			if coeffs(i) ~= 0
				n = n + 2;
			end
		end

		% Naive
		% Each term a_n * x^n requires n multiplications plus one addition.
		% If the powers are calculated by repeated multiplication.
		% A polynomial of degree 0 requires 0 operations.
		for i = 2:length(coeffs)
			if coeffs(i) ~= 0
				m = m + i + 1;
			end
		end
	end
end
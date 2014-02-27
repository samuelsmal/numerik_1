function y = f_1_exp_series(x, n)
% F_1_EXP_SERIES Exponential approximation
% f = f_1_exp_series(x, n) uses the series expression of exp to the nth degree to approximate exp(x).
	% Naive approach
	%y = 0;
	%for k = 0:n
	%	y = y + x.^(k) ./ f_1_factorial(k);
	%end

	k = [0:1:n];

	y = sum(x.^(k) ./ f_1_factorial(k));

end

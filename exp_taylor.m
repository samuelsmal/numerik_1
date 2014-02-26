function y = exp_taylor(x, n)
% EXP_TAYLOR Exponential approximation
% f = exp_taylor(x, n) uses a tailor expression to the nth degree to approximate exp(x).
	% Naive approach
	%y = 0;
	%for k = 0:n
	%	y = y .+ x.^(k) ./ factorial(k);
	%end
	%}

	k = [0:1:n];

	y = sum(x.^(k) ./ myfactorial(k));

end

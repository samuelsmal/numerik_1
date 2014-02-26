function y = myfactorial(x)
% MYFACTORIAL Factorial computation
% f = MYFACTORIAL(x) computes the factorial of the given integer.
	% works only for one number and is a quite dumb way...
	%if x < 0
	%	error('The factorial is only defined for positive numbers!')
	%end
	%
	%y = 1;
	%for i = 2:x
	%	y = y * i;
	%end
	%}

	tmp = cumprod(1:max(x));
	% this and the '+ 1' in the next line are needed 
	% to access the array correctly
	tmp = [1 tmp];
	y = tmp((x + 1));

	% I guess this would count as cheating...
	% y = gamma(x + 1)
end

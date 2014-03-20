%% f_4_numerical_integration: Integrates the function
% a begin of interval
% b end of interval
% fn function handle
% number of steps
% type of integration, can be midpoint, trapezoid or simpson
function [int, counter] = f_4_numerical_integration(a, b, fn, N, type)
	if N <= 0
		error('N must be greater than 0');	
	end

	if a >= b
		error('a must be smaller than b, it is the lower bound');
	end

	if ~isa(fn, 'function_handle')
		error('fn must be a function handle.');
	end

	if strcmpi(type, 'midpoint')
		s = 1;
		c = 1/2;
		w = 1;
	elseif strcmpi(type, 'trapezoid')
		s = 2;
		c = [0 1];
		w = [1/2 1/2];
	elseif strcmpi(type, 'simpson')
		s = 3;
		c = [0 1/2 1];
		w = [1/6 2/3 1/6];
	else
		error('type unknown');
	end

	h = (b - a) / N;
	x = a + h .* [0:1:N];

	int = 0;
	counter = 0;
	for i = 1:N
		for j = 1:s
			int = int + w(j) * fn(x(i) + h * c(j));
			counter = counter + 1;
		end
	end

	int = h * int;		
end

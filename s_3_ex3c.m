clc;

N = 2:50;
error_x_range = linspace(-5, 5, 1000);
max_error = zeros(length(N));

fn_to_interp = @(x) 1 ./ (1 + x.^2);

for i = 1:length(N)
	data_x = linspace(-5, 5, N(i));
    
    max_error(i) = max(abs(fn_to_interp(error_x_range)' - ...
    	f_3_plin_interpol(data_x, fn_to_interp(data_x), error_x_range)));
end

figure(1); clf;
semilogy(N, max_error);

title('Error in respect to N of the piecewise linear interpolation (log scale)');
xlabel('Number of data points');
ylabel('Absolute error');

print('../plots/assignment3/ex3c.png', '-dpng');
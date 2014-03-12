clc;

fn_to_interp = @(x) 1 ./ (1 + x.^2);

plot_data_x = -5:0.1:5;


figure(1); clf;
plot(plot_data_x, fn_to_interp(plot_data_x), 'r');
hold on;

for n_index = 2:10
	data_x = linspace(-5, 5, n_index);
	data_y = fn_to_interp(data_x);

	plot_data_y = zeros(length(plot_data_x));

	for i = 1:length(plot_data_x)
			plot_data_y(i) = f_3_plin_interpol(data_x, data_y, plot_data_x(i));
	end

	colour = 1 - 1 / n_index;

	plot(plot_data_x, plot_data_y, 'Color', [colour, colour, 1 - colour]);

end

title('Linear spline approximation of \frac{1}{1 + x^2}')
hold off;

print('../plots/assignment3/ex3b.png', '-dpng');
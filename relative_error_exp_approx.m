n = [0:1:20];

x_0 = [-10 -5 5 10];

% Not working...
%arrayfun( @(x) exp_approx(x_0, x), [0:20], "UniformOutput", false)
%y = arrayfun( exp_approx, [-10 -5 5 10], 0:20, "UniformOutput", false)

fun_handle = @(x, n) abs(exp_taylor(x, n) - exp(x)) / exp(x);

y = zeros(length(x_0), length(n));
for itr_x_0 = 1:length(x_0)
	for itr_n = 1:length(n)
		y(itr_x_0, itr_n) = fun_handle(x_0(itr_x_0), n(itr_n));
	end
end

% Sorry about the spacing...
% I tried something different then the usual multiplot way, which is below,
% but I ran into some problems.
figure;
s(1) = subplot(4,1,1);
semilogy(n, y(1,:))
title('e^{-10}')

s(2) = subplot(4,1,2);
semilogy(n, y(2,:))
title('e^{-5}')

s(3) = subplot(4,1,3);
semilogy(n, y(3,:))
title('e^{5}')

s(4) = subplot(4,1,4);
semilogy(n, y(4,:))
title('e^{10}')

xlabel('Degree of Taylor polynomial')

% Seems not to plot right.
fig2 = figure;

hold on;
colours = linspace(0.2, 0.8, length(x_0));
for i = 1:length(x_0)
	semilogy(n, y(i,:), 'Color', colours(i) * [1 1 1], 'LineWidth', 2);

end

title('Relative error of the Taylor approximation of the exponential function');
xlabel('Degree of the Taylor polynomial');
legend('x_0 = -10', 'x_0 = -5', 'x_0 = 5', 'x_0 = 10', 'Location', 'SouthWest');

hold off;
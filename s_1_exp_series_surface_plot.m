% Plots a 3d surface to visualize the error.

n = [0:5:300];
x_0 = [0:-5:-100];

fun_handle = @(x, n) abs(f_1_exp_series(x, n) - exp(x)) / exp(x);

y = zeros(length(x_0), length(n));
for itr_x_0 = 1:length(x_0)
	for itr_n = 1:length(n)
		y(itr_x_0, itr_n) = log(fun_handle(x_0(itr_x_0), n(itr_n)));
	end
end

figure(1)
clf(1)
surf(n,x_0,y)
title('Plot of the relative error, log scale');
ylabel('x_{0}');
xlabel('Polynomial degree');
zlabel('Relative error, on log scale');

set(get(gca,'ZLabel'),'Rotation',90);

view(213, 90-63);

print('../plots/ex1/rel_error_3d_1.png', '-dpng')


n = [0:10:500];
x_0 = [0:-10:-500];

y = zeros(length(x_0), length(n));
for itr_x_0 = 1:length(x_0)
	for itr_n = 1:length(n)
		y(itr_x_0, itr_n) = log(fun_handle(x_0(itr_x_0), n(itr_n)));
	end
end

figure(2)
clf(2)
surf(n,x_0,y)
title('Plot of the relative error, log scale');
ylabel('x_{0}');
xlabel('Polynomial degree');
zlabel('relative error, on log scale');

set(get(gca,'ZLabel'),'Rotation',90);

view(212, 90-54);

print('../plots/ex1/rel_error_3d_2.png', '-dpng')
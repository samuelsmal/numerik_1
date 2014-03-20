clc;

N   = [1:1:25];     
BOUNDS  = [0 2]; 
fn = @(t) cos(t);


figure(1); clf;

int_cos = sin(2); % value of integral of cos(x) between 0 and 2

plot([0 N(end)], [int_cos int_cos], 'b::', 'LineWidth', 2);
hold on;

approx_ints = zeros(length(N), 1);
for i = 1:length(N)
    approx_ints(i) = f_4_numerical_integration(BOUNDS(1), BOUNDS(2), fn, N(i), 'midpoint');
end
plot(N, approx_ints, 'g--', 'LineWidth', 2);

% figure options
grid on;
title('Approximation of the integral for cos(x) from 0 to 2 using the midpoint rule');
legend('Analytical computation of the integral of cos(x)', 'Approximation of the integral of cos(x) in respect to different N');
xlabel('Number of steps');

set(gcf,'PaperType','A5');
print('../plots/assignment4/ex2b.png', '-dpng');

hold off;
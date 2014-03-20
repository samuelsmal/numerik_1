clc;

h  = [5*10^(-1) 10^(-1) 5*10^(-2) 2*10^(-2) 10^(-2) 5*10^(-3) 2*10^(-3) 10^(-3) 5*10^(-4) 2*10^(-4) 10^(-4)];
BOUNDS = [0 2];        
fn    = @(h) (BOUNDS(end) - BOUNDS(1)) ./ h;
N  = fn(h);

g = @(t) cos(t);

figure(1); clf;

int_cos = sin(2);


errors = zeros(3, length(N));
for i = 1:length(N)
    errors(1, i) = abs(int_cos - f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'midpoint'));
    errors(2, i) = abs(int_cos - f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'trapezoid'));
    errors(3, i) = abs(int_cos - f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'simpson'));
end

loglog(h, errors(1, :), 'r', 'LineWidth', 1.5); % midpoint error
hold on;
loglog(h, errors(2, :), 'b', 'LineWidth', 1.5); % trapezoid error
loglog(h, errors(3, :), 'g', 'LineWidth', 1.5); % simpson error

% figure options
grid on;
title('Approximation error in respect to differenct stepping sizes');
legend('Midpoint Rule', 'Trapezoidal formula', 'Simpson''s rule', 'Location', 'NorthWest');
xlabel('Length of the stepping size');
ylabel('Error of approximation');

%set(gcf,'PaperType','A5');
print('../plots/assignment4/ex3a.png', '-dpng');

hold off;
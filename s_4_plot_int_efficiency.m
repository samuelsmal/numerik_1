clc;

h  = [5*10^(-1) 10^(-1) 5*10^(-2) 2*10^(-2) 10^(-2) 5*10^(-3) 2*10^(-3) 10^(-3) 5*10^(-4) 2*10^(-4) 10^(-4)];
BOUNDS = [0 2];        
fn    = @(h) (BOUNDS(end) - BOUNDS(1)) ./ h;
N  = fn(h);

g = @(t) cos(t);

figure(1); clf;

int_cos = sin(2);


errors = zeros(3, length(N));
operations = zeros(3, length(N));
for i = 1:length(N)
    [errors(1, i), operations(1, i)] = f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'midpoint');
    errors(1, i) = abs(int_cos - errors(1, i));
    
    [errors(2, i), operations(2, i)] = f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'trapezoid');
    errors(2, i) = abs(int_cos - errors(2, i));
    
    [errors(3, i), operations(3, i)] = f_4_numerical_integration(BOUNDS(1), BOUNDS(2), g, N(i), 'simpson');
    errors(3, i) = abs(int_cos - errors(3, i));
end

hold on;
loglog(operations(1, :), errors(1, :), 'r', 'LineWidth', 1.5); % midpoint error
loglog(operations(2, :), errors(2, :), 'b', 'LineWidth', 1.5); % trapezoid error
loglog(operations(3, :), errors(3, :), 'g', 'LineWidth', 1.5); % simpson error

% figure options
grid on;
title('Approximation error in respect to the number of operations');
legend('Midpoint Rule', 'Trapezoidal formula', 'Simpson''s rule', 'Location', 'NorthEast');
xlabel('Number of evaluations of the integrand');
ylabel('Error of approximation');
hold off;
print('../plots/assignment4/ex3b.png', '-dpng');
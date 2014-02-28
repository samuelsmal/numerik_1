% For simplicity I take only polynomials width coefficients c_i = 1
% for all i = 0 ... n
% And x = 1.
% Which leaves me with 2n operations for the horner method,
% and n(n-1)/2 operations for the naive way.

degrees = [0:1:100];

horner = @(n) 2 .* n;
naive = @(n) n + n .* (n-1) ./ 2;

figure;
clf;

plot(degrees, naive(degrees), 'b::', 'LineWidth', 2, degrees, horner(degrees), 'g--', 'LineWidth', 2);
title('Number of operations for Horners Method and the naive way');
xlabel('Degree of the polynomiald');
ylabel('Number of operations.');
legend('Naive', 'Horner', 'Location', 'NorthWest');

print('../plots/ex1/ops.png', '-dpng')
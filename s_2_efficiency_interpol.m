data = 1:20;

newton = (data.^2 + data) ./ 2 + data.*2 - 1;
lagrange = data.^2 + data;

figure(1)
plot(data, newton, 'b--', data, lagrange, 'g:')
title('Comparison of Newton and Lagrange interpolation')
xlabel('Number of data points')
ylabel('Amount of multiplications')

legend('Newton', 'Lagrange', 'Location', 'NorthWest')

print('../plots/ex2/efficiency.png', '-dpng');
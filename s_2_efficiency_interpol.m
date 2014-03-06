data = 1:20;

newton = data .^4;
lagrange = data .^3;

figure(1)
plot(data, newton, 'b--', data, lagrange, 'g:')
title('Worst-case comparision of Newton and Lagrange interpolation')
xlabel('Number of data points')
ylabel('Amount of multiplications')

legend('Newton', 'Lagrange', 'Location', 'NorthWest')

print('../plots/ex2/efficiency.png', '-dpng');
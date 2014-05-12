clc; clear all; close all;

f = @cos;
a=0; b=2;

exact_sol = sin(2);

s = 1:20;
err = zeros(size(s));

for i = 1:length(s)
    [x,w] = gauss_values(s(i),a,b);

    integral = w .* f(x);
    numerical_sol = sum(integral);

    err(i) = abs(exact_sol - numerical_sol);
end

figure(1);
semilogy(s, err, '-*');
xlabel('s');
ylabel('error');
title('error behaviour of Gauss-Legendre quadrature applied to $\int^2_0\cos(t)\,dt$','Interpreter','latex');
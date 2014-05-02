% function handle for e^x
f = @(x) exp(x);
a = 0;

h = [];

for i = 0:12
	h(i + 1) = 10^(-1 * i);
end

derivation  = zeros(length(h));
error       = zeros(length(h));

exactValue  = 1;

for i = 1 : length(h)
    derivation(i)   = (f(a+h(i))-f(a-h(i))) / (2*h(i));
    error(i)        = abs(exactValue - derivation(i)); % omitted the "/1"
end

figure(1);
loglog(h, error, '-r', 'LineWidth', 1.5)
title('Error plot for the approximation of e^x on a loglog scale')
xlabel('h')
ylabel('Relative error')
hold on;

print('../plots/assignment7/ex2-relativeError.png', '-dpng');
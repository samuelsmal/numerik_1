clc;

f = @(x) sin(x);

D = 5; % -d is the start point, d the end point.
NUM_OF_POINTS = [2 4 6 8 10];

sin_x = [-D:.1:D];
sin_y = f(sin_x);
figure(1); clf;
plot(sin_x, sin_y, 'r', 'LineWidth', 2); 
hold on;

color = 0;

error_x = linspace(-d, d, 1000);

for i = 1:length(NUM_OF_POINTS)
    
    color = color + 0.2;

    data = linspace(-d, d, NUM_OF_POINTS(i));

    [interpol_data_y, coeffs] = ...
        f_2_interpol(data, f(data), sin_x, 'newton');

    plot(sin_x, interpol_data_y, ... 
        '--', ...
        'Color', [color, color, 1 - color], ...
        'LineWidth', 1.5);
        
    max_error(i) = max(abs(f(error_x) - f_2_interpol(data, f(data), error_x, 'newton')));
end

hold off;

title('Approximation of sin(x) through Newtons method');
legend('sin(x)', '2 points', '4 points', '6 points', '8 points', ...
    '10 points', 'Location', 'SouthWest');

print('../plots/assignment3/ex1a.png', '-dpng');

figure(2); clf;
semilogy(NUM_OF_POINTS, max_error);
title('Error of the approximation on log scale');
xlabel('Number of equidistant data points');
ylabel('Absolute value of the error on log scale log(Error)')
set(get(gca,'YLabel'),'Rotation',90);

print('../plots/assignment3/ex1b.png', '-dpng');
%% GAUSS_VALUES
% This script is for computing definite integrals using Legendre-Gauss 
% Quadrature. Computes the Legendre-Gauss nodes and weights  on an interval
% [a,b] with truncation order N
function [x, weights] = gauss_values(order, start_x, end_x)

    %order = order - 1;
    N1    = order;
    N2    = order + 1;

    derivation_space = linspace(-1,1, order)';

    % Initial guess
    initial_guess = cos((2 * (0 : (order - 1))' + 1) * pi / (2 * (order - 1) + 2)) ...
        + (0.27 / order) * sin(pi * derivation_space * (order - 1) / (order + 1));

    % Legendre-Gauss Vandermonde Matrix
    legendre_gaus_van_matrix = zeros(order, order + 1);

    % Derivative of LGVM
    deriv_lgvm = zeros(order, 1);

    % Compute the zeros of the N+1 Legendre Polynomial
    % using the recursion relation and the Newton-Raphson method

    y0 = 2;

    % Iterate until new points are uniformly within epsilon of old points
    while max(abs(initial_guess - y0)) > eps
        
        
        legendre_gaus_van_matrix(:, 1) = 1;
        deriv_lgvm = 0;
        
        legendre_gaus_van_matrix(:, 2) = initial_guess;
        deriv_lgvm = 1;
        
        for k = 2 : order
            legendre_gaus_van_matrix(:, k + 1) = ((2 * k - 1) * initial_guess ...
                .* legendre_gaus_van_matrix(:, k) - (k - 1) ...
                * legendre_gaus_van_matrix(:, k - 1)) / k;
        end
     
        deriv_lgvm = (order + 1) * (legendre_gaus_van_matrix(:, order) ...
            - initial_guess .* legendre_gaus_van_matrix(:, (order + 1))) ...
            ./ (1 - initial_guess.^2);   
        
        y0 = initial_guess;
        initial_guess = y0 - legendre_gaus_van_matrix(:, (order + 1)) ./ deriv_lgvm;
        
    end

    % Linear map from[-1,1] to [a,b]
    x = (start_x * (1 - initial_guess) + end_x * (1 + initial_guess)) ...
        / 2;      

    weights = (end_x - start_x) ./ ((1 - initial_guess .^ 2) ... 
        .* deriv_lgvm .^ 2) * ((order + 1) / order) ^ 2;

end
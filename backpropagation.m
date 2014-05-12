%% BACKPROPAGATION:
% x = backpropagation(coeff_matrix, coeff_vect) returns the solution to the Ax = b
% A has to be a upper triangle matrix
% NOT TESTED
function [x] = backpropagation(coeff_matrix, coeff_vect)   

	solution = zeros(size(coeff_matrix, 1));

    solution(end) = coeff_vect(end) / coeff_matrix(end, end);

    size_coeff_matrix = size(coeff_matrix, 1);

    for k = (size_coeff_matrix - 1) : (-1) : 1
        solution(k) = coeff_vect(k);

        for j = (k + 1) : size_coeff_matrix
            solution(k) = solution(k) - solution(j) * coeff_matrix(k, j);
        end

        solution(k) = solution(k) / coeff_matrix(k, k);
    end
end

function [y b] = f_1_horner2(coeffs, x_0)
% F_1_HORNER2 computes the value of the polynomial at x_0 and the divided
% coefficient vector.
% [y b] = f_1_horner2(coeffs, x_0)
    b(1) = coeffs(1);
    for i = 2:length(coeffs)
        b(i) = coeffs(i) + x_0 .* b(i-1);
    end
    
    y = b(length(coeffs));
    b = b(1:length(b)-1);
end
clc; clear all; close all;

d = 5;
% Check 'help toeplitz' for the code.
A = toeplitz([-2, 1, zeros(1,d-2)])
% m = randi(100,5,4);
% A = spdiags(m,-2:1,5,5); A = full(A);

[L, U] = lu(A);

disp('The Matlab built-in function ''lu'' gives the result');
display(L);
display(U);

%--------------------------------------------------%
% Attention:                                       %
% The result by lu may not be the same as          %
% the result by user-defined function.             %
% Because the Matlab lu function uses the pivoting.%
%--------------------------------------------------%

[L, U, ops] = lu_band_matrix_decomp(A);
disp('The function ''lu_band_matrix_decomp'' gives the result');
display(L);
display(U);
disp('L * U = ');
L*U
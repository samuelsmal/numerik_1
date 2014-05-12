clc; clear all; close all;

A = [2, 2, 2, 2; ...
     4, 6, 6, 6; ...
     6,14,16,16; ...
     2, 2,12,14]

b = [12; ...
     34; ...
     82; ...
     42];

[L, U, x] = lu_factorization(A, b);

display(L);
display(U);

disp('L * U');
L * U

disp('solution:');
display(x);
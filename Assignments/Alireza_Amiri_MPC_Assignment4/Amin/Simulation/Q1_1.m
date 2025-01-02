clc; clear; close all;

% Define the symbolic parameters
syms s ksp Ks ke Ai A0 tau Kp C ma d

% % Numerator and Denominator of Transfer Function
numerator = (ksp * Ks * ke * (Ai + A0)) / (tau * s + 1);
denominator = ((Kp + C * s) * (ma * s^2 + d * s + ke) + (Ai^2 * s + A0^2 * s));
% ksp = 75/s + 25/s^2+1;
% numerator = (ksp * 1 * 1 * (1 + 1)) / (1 * s + 1);
% denominator = ((1 + 1 * s) * (1 * s^2 + 1 * s + 1) + (1^2 * s + 1^2 * s));

% Get coefficients of numerator and denominator
[num, den] = numden(numerator / denominator);
num_coeffs = sym2poly(num);
den_coeffs = sym2poly(den);

% % Convert to state-space representation
[A, B, C, D] = tf2ss(num_coeffs, den_coeffs);

% Display the matrices
disp('State-Space Matrices:');
disp('A = '); disp(A);
disp('B = '); disp(B);
disp('C = '); disp(C);
disp('D = '); disp(D);

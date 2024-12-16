clc; clear; close all;

% Parameter ranges pertaining to the linear transfer function (Table 1)
t = 25;
ke = 75 + 25 * sin(t);                 % k_e (kN/m)
Ks = 0.375 + 0.125 * sin(t);           % K_s (m^3/ Pa.s)
Kp = 2.5e-12 + 2.5e-12 * sin(t);       % K_p (m^2/ s)
C1 = 2e-11 + 1e-11 * sin(t);           % C (m^3/ Pa)
d = 700 + 100 * sin(t);                % d (N/m/s)
ma = 20.0 + 0.1 * sin(t);              % m_a (kg)
Ai = 0.00203 + 0.0001 * sin(t);        % A_i (m^2)
Ao = 0.00152 + 0.00008 * sin(t);       % A_o (m^2)
ksp = 0.0012 + 0.0001 * sin(t);        % k_sp (m/V)
tau = 35 + 5 * sin(t);                 % tau (ms)

% Definig the parameters calculated for the state-space equations

a1 = (tau .* (Kp .* ma + C1 .* d) + (C1 .* ma)) ./ (tau .* C1 .* ma);
a2 = (tau .* (Kp .* d + C1 .* ke + Ai.^2 + Ao.^2) + (Kp .* ma + C1 .* d)) ./ (tau .* C1 .* ma);
a3 = (tau .* Kp .* ke + Kp .* d + C1 .* ke + Ai.^2 + Ao.^2) ./ (tau .* C1 .* ma);
a4 = (Kp .* ke) ./ (tau .* C1 .* ma);
beta = (ksp .* Ks .* ke .* (Ai + Ao)) ./ (tau .* C1 .* ma);

% State-Space Matrices

A = [
    0   1   0   0;
    0   0   1   0;
    0   0   0   1;
    -a4 -a3 -a2 -a1
    ];

B = [
    0;
    0;
    0;
    beta
    ];

C = [1 0 0 0];

D = 0;

sys = ss(A, B, C, D);

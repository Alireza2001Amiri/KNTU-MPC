% Transfer function coefficients
numerator = [2.239e5];
denominator = [1, 483.4, -1888, -9.127e5];

% Define the transfer function
Gp = tf(numerator, denominator);

% Plot the root locus
figure;
rlocus(Gp);
title('Root Locus of G_p(s)');
grid on;

% Compute the poles, damping ratio, and natural frequency
[poles, zeros] = pzmap(Gp); % Get poles and zeros

% Calculate damping ratio and natural frequency for each pole
damping_ratios = []; % Initialize empty arrays
natural_frequencies = [];

for k = 1:length(poles)
    [wn, zeta] = damp(tf(1, [1 -2*real(poles(k)) abs(poles(k))^2])); % Calculate for each pole
    damping_ratios = [damping_ratios; zeta]; % Append results
    natural_frequencies = [natural_frequencies; wn];
end

% Display results
fprintf('Poles of the transfer function:\n');
disp(poles);

fprintf('Damping ratios of the poles:\n');
disp(damping_ratios);

fprintf('Natural frequencies of the poles (rad/s):\n');
disp(natural_frequencies);

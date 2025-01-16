% Generate default plot parameters for the explicit MPC
plotParams = generatePlotParameters(empc1);

% Allow all states to vary
plotParams.State.Index = [];  % No fixed states
plotParams.State.Value = [];  % No fixed values for states

% Fix the manipulated variable (MV)
plotParams.ManipulatedVariable.Index = 1;  % First MV
plotParams.ManipulatedVariable.Value = 0;  % Fix MV to 0

% Fix the first reference signal
plotParams.Reference.Index = 1;  % First reference
plotParams.Reference.Value = 0;  % Fix first reference to 0

% Generate the 2D section plot
figure;
plotSection(empc1, plotParams);

% Add labels and title for clarity
xlabel('State x1');
ylabel('State x2');
title('Explicit MPC Regions (State x1 vs State x2)');
grid on;

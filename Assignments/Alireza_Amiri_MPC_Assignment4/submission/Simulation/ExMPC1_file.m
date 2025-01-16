% Create a copy of the original MPC for explicit version
empc_setup = mpc1;

% Significantly reduce horizons for explicit MPC
empc_setup.PredictionHorizon = 30;  % Reduced from 100
empc_setup.ControlHorizon = 3;     % Reduced from 30

% Generate range for explicit MPC
range = generateExplicitRange(empc_setup);

% Set combined state and output constraints
range.State.Min = [-0.5; -1; -1; -1; -1; -1; -1; -1];
range.State.Max = [0.5; 1; 1; 1; 1; 1; 1; 1];

% Set reference constraints
range.Reference.Min = [-1; -1; -1; -1];
range.Reference.Max = [1; 1; 1; 1];

% Set MV constraints
range.ManipulatedVariable.Min = -1;
range.ManipulatedVariable.Max = 1;

% Configure explicit MPC generation options
opt = generateExplicitOptions(empc_setup);
opt.polyreduction = 1;
opt.dimensions = 'all';
opt.verbose = 2;

% Generate the explicit MPC controller
empc1 = generateExplicitMPC(empc_setup, range, opt);
%% %% 

EMPCobj_Simple = simplify(empc1,'exact');
disp('EMPCobj_Simple');

params = generatePlotParameters(empc1);
params.Refrence.Index(1) = 1;
params.Refrence.Value(1) = 0;
params.ManipulatedVariable.Index(1) = 1;
params.ManipulatedVariable.Value(1) = 0;
params.State.Index = 1;
params.State.Value = 0;

plotSection(EMPCobj_Simple,params)
grid
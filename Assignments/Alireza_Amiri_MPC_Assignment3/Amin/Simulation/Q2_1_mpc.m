%% create MPC controller object with sample time
mpc1 = mpc(plant_C, 0.01);
%% specify prediction horizon
mpc1.PredictionHorizon = 800;
%% specify control horizon
mpc1.ControlHorizon = 150;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = 0;
mpc1.Model.Nominal.Y = [0;0;2;0.5];
%% specify weights
mpc1.Weights.MV = 0;
mpc1.Weights.MVRate = 0.1;
mpc1.Weights.OV = [1 0 0 0];
mpc1.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc1, 1001, mpc1_RefSignal, mpc1_MDSignal, options);

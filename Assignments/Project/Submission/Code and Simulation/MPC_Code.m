%% create MPC controller object with sample time
mpc1 = mpc(mpc1_plant_C, 0.04);
%% specify prediction horizon
mpc1.PredictionHorizon = 100;
%% specify control horizon
mpc1.ControlHorizon = 30;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = [0;0;0;0;0;0];
mpc1.Model.Nominal.Y = [0;0;0;0;0;0];
%% specify weights
mpc1.Weights.MV = [0 0 0 0 0 0];
mpc1.Weights.MVRate = [0.104081077419239 0.104081077419239 0.104081077419239 0.104081077419239 0.104081077419239 0.104081077419239];
mpc1.Weights.OV = [0.960789439152323 0.960789439152323 96.0789439152323 96.0789439152323 96.0789439152323 0.960789439152323];
mpc1.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc1, 251, mpc1_RefSignal, mpc1_MDSignal, options);

%% create MPC controller object with sample time
mpc1 = mpc(plant_C, 0.01);
%% specify prediction horizon
mpc1.PredictionHorizon = 100;
%% specify control horizon
mpc1.ControlHorizon = 30;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = 0;
mpc1.Model.Nominal.Y = [0;0;0;0];
%% specify constraints for OV
mpc1.OV(1).Min = -1;
mpc1.OV(1).Max = 1;
%% specify overall adjustment factor applied to weights
beta = 1.4333;
%% specify weights
mpc1.Weights.MV = 0*beta;
mpc1.Weights.MVRate = 0.1/beta;
mpc1.Weights.OV = [200 1 200 1]*beta;
mpc1.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';


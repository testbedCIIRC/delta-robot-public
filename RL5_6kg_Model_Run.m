% This script is to load the required data/parameters and to run the
% Simulink model of Delta Robot - RL5-1450-6 kg. 

clear all
close all

%% Loading trajectory, robot parameters; Identifying the mass distribution parameter, and simulation

load('Trj1_RL5_1450_6kg_Ts_1ms')
% load('Trj2_RL5_1450_6kg_Ts_1ms')
% load('Trj3_RL5_1450_6kg_Ts_1ms')

% assigning initial values to run Simulink
Sro1 = 0.3485;  Sro2 = 0.6103;  Sro6u = 0.3919; Sro6l = 0.5611;

RL5_6kg_Inertia_Mass      % Assigning MoI and mass parameters of the robot bodies
RL5_6kg_Dynamic_Param     % Assigning Simulink model parameters
sim RL5_6kg_2021a_enc     % Run the simulation to collect data for Parameter Estimation
RL5_6kg_Param_Estimate    % Estimate the parameters via LSM, and assign estimated values to rho1, rho2, rho6u, rho6l
sim RL5_6kg_2021a_enc     % Run again the simulation with the estimated mass distribution parameters

% plotting the TCP path in xyz-coordinates
plot3(posH.signals(1).values,posH.signals(2).values,posH.signals(3).values),grid
title('Geometrical path of TCP (H point) in 3D Cartesian Space')
xlabel('$x$ [m]','Interpreter','latex')
ylabel('$y$ [m]','Interpreter','latex')
zlabel('$z$ [m]','Interpreter','latex')
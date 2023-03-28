% This script is to load the required data/parameters and to run the
% Simulink model of a 3-DoF Basic Delta Robot which is created from the
% robot RL5-1450-6 kg. by excluding the serial extension of the robot. 

clear all
close all

%% Loading trajectory, robot parameters; Identifying the mass distribution parameter, and simulation

load('Trj1_RL5_1450_6kg_Ts_1ms')

% assigning initial values to run Simulink
Sro1 = 0.3485;  Sro2 = 0.6103;  Sro6u = 0.3919; Sro6l = 0.5611;

RL5_6kg_Inertia_Mass               % Assigning MoI and mass parameters of the robot bodies
Basic_3DoF_Delta_Dynamic_Param     % Assigning Simulink model parameters
sim Basic_3DoF_Delta_2021a         % Run the simulation to collect data for Parameter Estimation
Basic_3DoF_Delta_Param_Estimate    % Estimate the parameters via LSM, and assign estimated values to rho1, rho2 

sim Basic_3DoF_Delta_2021a         % Run again the simulation with the estimated mass distribution parameters

Basic_3DoF_Delta_Plot_Fig          % Plot the sensed vs. calculated torque values 

%% performing trajectories for the circular and cubic TCP paths

% load('Trj2_RL5_1450_6kg_Ts_1ms') % circular TCP path
% sim Basic_3DoF_Delta_2021a
% Basic_3DoF_Delta_Plot_Fig
 
% load('Trj3_RL5_1450_6kg_Ts_1ms') % cubic TCP path
% sim Basic_3DoF_Delta_2021a
% Basic_3DoF_Delta_Plot_Fig

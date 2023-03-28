
%%%% ROBOT PARAMETERS FOR THE KINEMATIC AND DYNAMIC MODELS %%%%

%% Length/distance parameters for the robot model -- standard right-handed Cartesian coordinate system
q0 = 5.327998*pi/180;   % [rad], 5.327998° ~ q0*pi/180 rad, angle( axis_i & line(A_i,B_i) )
r0 =  0.330;   % [m], radius of circumscribed circle of equilat. basic frame triangle
l1 =  0.420;   % [m], lengths of upper arms
l2 =  1.055;   % [m], lengths of forearms
r3 =  0.125;   % [m], radius of circumscribed circle of equilat. mov. platform trngl.
r4 =  0.0632;  % [m], radius of wrist arm offset, distance from point E to F
h4 =  0.132;   % [m], perpendicular distance from point D to E
r5 =  0.135;   % [m], radius of swivel arm, distance from point E to F (distance A5-axis vs. Tool Center Point (TCP), i.e. H point)
dr =  r0 - r3; % [m], useful simplifying constant

%% Masses of the individual bodies
m1 = Inertias.Solid(2).mass;        % mass of the each upper arm [kg]
m2 = 2*Inertias.Solid(3).mass;      % mass of the each forearm (having two bars)
me = Inertias.Solid(4).mass;        % mass of the elbow pins 
m3 = Inertias.Solid(5).mass;        % mass of the movable platform 
% m4 = Inertias.Solid(10).mass;     % mass of the wrist arm 
m4 = 0;                             % wrist arm excluded to create 3-axis Delta 
% m5 = Inertias.Solid(11).mass;     % mass of the swivel arm
m5 = 0;                             % swivel arm excluded to create 3-axis Delta 

%% The parameters of gearboxes and motor
Im = 0;                                     % motor MoI, assigned zero since not incuded in Simulink model
k = 55;                                     % gearbox ratios for A1,A2,A3
Ig = Inertias.Solid(18).MoI(3);             % gearbox MoI for A1,A2,A3

%% Distribution ratios for masses of upper arm, lower arm, upper shafts and lower shafts, respectively
rho1 = Sro1; % mass distribution ratio for the upper arms, FROM LSM ESTIMATION 
rho2 = Sro2; % mass distribution ratio for the forearms, FROM LSM ESTIMATION 

% rho6u = Sro6u; % mass distribution ratio for the upper parts of telescopic shafts, FROM LSM ESTIMATION 
% rho6l = Sro6l; % mass distribution ratio for the lower parts of telescopic shafts, FROM LSM ESTIMATION 

%% Total masses at the upper arm, movable platform and shafts

% Constant total mass at movable platform level (point D)
mD = m3 + 3*m2 + 3*me;         % trajectory dependent part -rho2*(cos(q1)+cos(q2)+cos(q3))*m2- appears in Simulink model

% Total mass of the upper and lower parts of the telescopic shafts 
% m6u = mus_a4 + mus_a5;       % upper parts of shafts A4 and A5
m6u = 0;                       % telescopic shafts excluded to create 3-axis Delta 
% m6l = mls_a4 + mls_a5;       % lower parts of shafts A4 and A5
m6l = 0;                       % telescopic shafts excluded to create 3-axis Delta 

%% Constant parts (trajectory independent) of CoG and MoI parameters at the upper arm level
lB = l1*(rho1*m1 + me);         % constant term of the numerator of l_{B_i} in Eq. (44), trajectory dependent part -rho2*cos(q_i)*m2- appears in Simulink model

rho1e = 1/3 ;                   % rho1 in the paper Codourey'96
lBe = l1*(m1/2 + me);           % l_{B_i} in the paper Codourey'96

IB = l1^2 * (rho1*m1 + me);     % constant term of I_{B_i} in Eq. (47), trajectory dependent part -rho2*cos(q_i)*m2- appears in Simulink model
IBe = l1^2 * (rho1e*m1 + me);   % constant term of I_{B_i} as in Codourey'96

IA = k^2*Ig;                    % Eq. (47), effective MoI of gearbox A1,A2,A3

IAB = (Im + IA + IB);           % inertia values at each upper arm
IABe = (Im + IA + IBe);         % inertia values at each upper arm in Codourey'96

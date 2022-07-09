
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
m4 = Inertias.Solid(10).mass;       % mass of the wrist arm 
m5 = Inertias.Solid(11).mass;       % mass of the swivel arm

mus_a4 = Inertias.Solid(8).mass;        % mass of the upper telescopic shaft A4
mls_a4 = Inertias.Solid(9).mass;        % mass of the lower telescopic shaft A4
mls_a4_spi = Inertias.Solid(7).mass;    % mass of the lower telescopic shaft spider A4

mudy_a5 = Inertias.Solid(13).mass;      % mass of the upper driving yoke A5, not used in math. model;fixed to base frame

mus_a5 = Inertias.Solid(15).mass;       % mass of the upper telescopic shaft A5
mls_a5 = Inertias.Solid(16).mass;       % mass of the lower telescopic shaft A5
mls_a5_spi = Inertias.Solid(14).mass;   % mass of the lower telescopic shaft spider A5
mls_a5_worm = Inertias.Solid(17).mass;  % mass of the lower worm shaft of A5

%% The parameters of gearboxes and motor
Im = 0;                                     % motor MoI, assigned zero since not incuded in Simulink model
k = 55;                                     % gearbox ratios for A1,A2,A3
Ig = Inertias.Solid(18).MoI(3);             % gearbox MoI for A1,A2,A3

k4 = 28.11;                                 % gearbox ratio for A4
Ig4 = Inertias.Solid(19).MoI(3);            % gearbox MoI for A4

%% Used MoI parameters of rigid bodies for A4-A5 axis about their longitudinal axis (wrt defined local frames of bodies)
% Solid 6,7,8,9 rotates wrt q4
I4uch = Inertias.Solid(6).MoI(2);     % MoI of the driving yoke (input shaft) A4 about y-axis 

I4ucr = 2*Inertias.Solid(7).MoI(3);   % total MoI of the cardan rings A4 about z-axis (upper and lower)
I4us = Inertias.Solid(8).MoI(1);      % MoI of the upper telescopic shaft A4  about x-axis 
I4ls = Inertias.Solid(9).MoI(2);      % MoI of the lower telescopic shaft A4  about y-axis 

% Solid 10 rotates wrt q4
I4wg = Inertias.Solid(10).MoI(2);     % MoI of the wrist arm about y-axis

% Solid 11,13,14,15,16 rotates wrt q4 and q5
I5uch = Inertias.Solid(13).MoI(2);    % MoI of the driving yoke (input shaft) A5 about y-axis
I5ucr = 2*Inertias.Solid(14).MoI(2);  % total MoI of the cardan rings A5 about y-axis (upper and lower)
I5us = Inertias.Solid(15).MoI(2);     % MoI of the upper telescopic shaft A5 about y-axis
I5ls = Inertias.Solid(16).MoI(2);     % MoI of the lower telescopic shaft A5 about y-axis
I5ws = Inertias.Solid(17).MoI(2);     % MoI of the worm shaft A5 about y-axes

% MoI parameters used in dynamic model of the serial part
I4g = k4^2*Ig4 ;                      % effective MoI of gearbox A4
hI4 = I4wg + I4uch ;                  % \hat{I_4} in Eq. (55)
tI4 = I4us + I4ls + I4ucr ;           % \tilde{I_4} in Eq. (55) 

hI5 = I5uch + I5ws ;                  % \hat{I_5} in Eq. (52)
tI5 = I5us + I5ls + I5ucr ;           % \tilde{I_5} in Eq. (52) 

%% Distribution ratios for masses of upper arm, lower arm, upper shafts and lower shafts, respectively
rho1 = Sro1; % mass distribution ratio for the upper arms, FROM LSM ESTIMATION 
rho2 = Sro2; % mass distribution ratio for the forearms, FROM LSM ESTIMATION 

rho6u = Sro6u; % mass distribution ratio for the upper parts of telescopic shafts, FROM LSM ESTIMATION 
rho6l = Sro6l; % mass distribution ratio for the lower parts of telescopic shafts, FROM LSM ESTIMATION 

%% Total masses at the upper arm, movable platform and shafts

% Constant total mass at movable platform level (point D)
mD = m3 + 3*m2 + 3*me + mls_a4_spi + mls_a5_spi + mls_a5_worm; % trajectory dependent part -rho2*(cos(q1)+cos(q2)+cos(q3))*m2- appears in Simulink model

% Total mass of the upper and lower parts of the telescopic shafts 
m6u = mus_a4 + mus_a5;       % upper parts of shafts A4 and A5
m6l = mls_a4 + mls_a5;       % lower parts of shafts A4 and A5

%% Constant parts (trajectory independent) of CoG and MoI parameters at the upper arm level
lB = l1*(rho1*m1 + me);         % constant term of the numerator of l_{B_i} in Eq. (41), trajectory dependent part -rho2*cos(q_i)*m2- appears in Simulink model

IB = l1^2 * (rho1*m1 + me);     % constant term of I_{B_i} in Eq. (44), trajectory dependent part -rho2*cos(q_i)*m2- appears in Simulink model

IA = k^2*Ig;                    % Eq. (44), effective MoI of gearbox A1,A2,A3
IAB = (Im + IA + IB);           % inertia values at each upper arm

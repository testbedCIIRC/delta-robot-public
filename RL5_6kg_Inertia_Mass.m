%%%%% PARAMETERS OF EACH BODY OF THE ROBOT %%%%

%Upper arm
mred_upperarm=0.208218-(3.47*0.17224^2)-(0.226*0.42^2);

Inertias.Solid(1).mass = 0;  % kg
Inertias.Solid(1).CoM = [0 0 0];  % m
Inertias.Solid(1).MoI = [0 0 0];  % kg*m^2
Inertias.Solid(1).PoI = [0 0 0];  % kg*m^2

Inertias.Solid(2).mass = 3.696;  % kg
Inertias.Solid(2).CoM = [0.2463 0.027 0];  % m
Inertias.Solid(2).MoI = [0 0 mred_upperarm];  % kg*m^2
Inertias.Solid(2).PoI = [0 0 0];  % kg*m^2

clear mred_upperarm;

%Forearm
Inertias.Solid(3).mass = 0.525;  % kg
Inertias.Solid(3).CoM = [0.5275, -6.38428e-05, -1.52511e-07];  % m
Inertias.Solid(3).MoI = [5.22934e-05, 0.043009, 0.0430094];  % kg*m^2
Inertias.Solid(3).PoI = [-3.36506e-11, -4.1059e-10, 1.5672e-10];  % kg*m^2

%Pin
Inertias.Solid(4).mass = 0.226;   % kg 
Inertias.Solid(4).CoM = [0 0 0];  % m
Inertias.Solid(4).MoI = [1.56006e-05, 0.000622941, 0.000616676];  % kg*m^2
Inertias.Solid(4).PoI = [0 0 0];  % kg*m^2

%Movable platform
Inertias.Solid(5).mass = 2.916;  % kg
Inertias.Solid(5).CoM = [0 0 0];  % m
Inertias.Solid(5).MoI = [0 0 0];  % kg*m^2
Inertias.Solid(5).PoI = [0 0 0];  % kg*m^2

%A4 Universal joint driving yoke
Inertias.Solid(6).mass = 2.35099;
Inertias.Solid(6).CoM = [0, -0.0508829, 0];  % m
Inertias.Solid(6).MoI = [0, 0.00547085, 0];
Inertias.Solid(6).PoI = [0 0 0];  % kg*m^2

%A4 Universal joint spider
Inertias.Solid(7).mass = 0.5279;  % kg
Inertias.Solid(7).CoM = [0, 0, 0.011];  % m
Inertias.Solid(7).MoI = [0.00049689, 0.000496889, 0.000953315];  % kg*m^2
Inertias.Solid(7).PoI = [-1.57428e-10, -1.22875e-11, -1.57453e-10];  % kg*m^2

%A4 Upper telescopic shaft 
Inertias.Solid(8).mass = 6.766;  % kg
Inertias.Solid(8).CoM = [-0.26545 0 0];  % m
Inertias.Solid(8).MoI = [0.00825, 0.293834, 0.290588];  % kg*m^2
Inertias.Solid(8).PoI = [-7.99483e-10, -5.91821e-08, -4.10348e-06];  % kg*m^2

%A4 Lower telescopic shaft 
Inertias.Solid(9).mass = 3.647;  % kg
Inertias.Solid(9).CoM = [0 -0.1870 0];  % m
Inertias.Solid(9).MoI = [0.181318, 0.009568, 0.180452];  % kg*m^2
Inertias.Solid(9).PoI = [1.96346e-08, 1.51539e-09, -8.50445e-07];  % kg*m^2

%Worm drive 
Inertias.Solid(10).mass = 8.578;  % kg
Inertias.Solid(10).CoM = [-0.0424798, -0.0785783, 1.51765e-05];  % m
Inertias.Solid(10).MoI = [0.0368063, 0.0276075, 0.0474216];  % kg*m^2
Inertias.Solid(10).PoI = [-1.21136e-05, -2.41625e-05, -0.00404043];  % kg*m^2

%Flange (swivel part)
Inertias.Solid(11).mass = 1.072;  % kg
Inertias.Solid(11).CoM = [6.85782e-07, 9.88606e-06, 0.0432725];  % m
Inertias.Solid(11).MoI = [0.00334337, 0.00568366, 0.0037991];  % kg*m^2
Inertias.Solid(11).PoI = [-2.60782e-07, -6.18738e-08, -1.59845e-06];  % kg*m^2

Inertias.Solid(12).mass = 0;  % kg
Inertias.Solid(12).CoM = [0 0 0];  % m
Inertias.Solid(12).MoI = [0 0 0];  % kg*m^2
Inertias.Solid(12).PoI = [0 0 0];  % kg*m^2

%A5 Universal joint driving yoke
Inertias.Solid(13).mass = 1.57016;  % kg
Inertias.Solid(13).CoM = [-2.29491e-10, 0.0222761, -3.33311e-07];  % m
Inertias.Solid(13).MoI = [0, 0.000318698, 0];  % kg*m^2
Inertias.Solid(13).PoI = [0 0 0];  % kg*m^2

%A5 Universal joint spider
Inertias.Solid(14).mass = 0.0245363;  % kg
Inertias.Solid(14).CoM = [-2.43992e-11, -6.12467e-08, -5.54773e-08];  % m
Inertias.Solid(14).MoI = [2.71658e-06, 5.08275e-06, 2.71658e-06];  % kg*m^2
Inertias.Solid(14).PoI = [8.33694e-17, 3.34738e-20, 5.02617e-17];  % kg*m^2

%A5 Upper telescopic shaft 
Inertias.Solid(15).mass = 1.276;  % kg
Inertias.Solid(15).CoM = [0 0.1510 0];  % m
Inertias.Solid(15).MoI = [0.0557234, 0.000129, 0.0557411];  % kg*m^2
Inertias.Solid(15).PoI = [-2.39149e-08, 4.2054e-11, 3.85033e-14];  % kg*m^2

%A5 Lower telescopic shaft 
Inertias.Solid(16).mass = 0.792;  % kg
Inertias.Solid(16).CoM = [0 0.245365 0];  % m
Inertias.Solid(16).MoI = [0.0459963, 0.0002079, 0.0460052];  % kg*m^2
Inertias.Solid(16).PoI = [1.08391e-07, 2.10142e-11, 2.78483e-14];  % kg*m^2

%A5 Worm
Inertias.Solid(17).mass = 0.32;  % kg
Inertias.Solid(17).CoM = [0, -0.0597258, 0];  % m
Inertias.Solid(17).MoI = [0, 0.000154, 0];  % kg*m^2
Inertias.Solid(17).PoI = [0 0 0];  % kg*m^2

%Upper arm reduced gearbox
Inertias.Solid(18).mass = 0;  % kg
Inertias.Solid(18).CoM = [0 0 0];  % m
Inertias.Solid(18).MoI = [0 0 2.07*1e-4];  % kg*m^2
Inertias.Solid(18).PoI = [0 0 0];

%A4 Reduced gearbox
Inertias.Solid(19).mass = 0;  % kg
Inertias.Solid(19).CoM = [0 0 0];  % m
Inertias.Solid(19).MoI = [0 0 2.4*1e-4];  % kg*m^2
Inertias.Solid(19).PoI = [0 0 0];

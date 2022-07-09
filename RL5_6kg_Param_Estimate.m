% Estimation of the mass distribution ratios (\rho_i)of the proposed robot model  
% by the Least Squares Method 

%% Stacking the regressor matrix and output torque vector data for the Estimation model

% Upper arm joint actuation torque values sensed from Simulink model  
torque_sensed.signals(1).values(1) = torque_sensed.signals(1).values(2);    % tau_1 
torque_sensed.signals(2).values(1) = torque_sensed.signals(2).values(2);    % tau_2
torque_sensed.signals(3).values(1) = torque_sensed.signals(3).values(2);    % tau_3

Tau_data = [torque_sensed.signals(1).values; torque_sensed.signals(2).values; torque_sensed.signals(3).values]; % stacked output torque vector in (61)
Psi_data = Psi_c.signals.values;    % data for the regressor matrix in (61) from the sampled values of (59) 

clear aa psi1 psi2 psi3

numData = length(Qrad);             % size of sampled data

for i = 1:numData 
    psi1(i,:) = Psi_data(1,:,i);
    psi2(i,:) = Psi_data(2,:,i);
    psi3(i,:) = Psi_data(3,:,i);
end
Psi_data = [psi1 ; psi2 ; psi3];    % Stacked regressor matrix in (61)

%% LSM for l6 = sqrt(xD^2+yD^2) and mD = mD + (rho6u*l6*m6u + (1-l6)*rho6l*m6l); 

lb = [ IA+l1^2*(0.01*m1+me) ; l1^2*0.01*m2 ;  m4-0.01 ; m5-0.01 ; mD-0.01 ; 0.01*m2 ; 0.01*m6u ; 0.01*m6l ; 0.01*m6l ; l1*(0.01*m1+me) ; l1*0.01*m2 ];       % Lower bound for estimation parameter vector Phi
ub = [ IA+l1^2*(0.99*m1+me) ; l1^2*0.99*m2 ; m4+0.01 ; m5+0.01 ; mD+0.01 ; 0.99*m2 ; 0.99*m6u ; 0.99*m6l ; 0.99*m6l ; l1*(0.99*m1+me) ; l1*0.99*m2 ];   % Upper bound for estimation parameter vector Phi

% Matrix and vector for the equality constraint in the optimization model (62)
Aeq = [1 0 0 0 0 0 0 0 0 -l1 0 ; 0 2 0 0 0 -l1^2 0 0 0 0 -l1 ; 0 0 1 0 0 0 0 0 0 0 0 ; ... 
       0 0 0 1 0 0 0 0 0 0 0 ; 0 0 0 0 1 0 0 0 0 0 0   ; zeros(2,11) ; 0 0 0 0 0 0 0 1 -1 0 0 ; ... 
       0 1 0 0 0 -l1^2 0 0 0 0 0 ; 0 1 0 0 0 0 0 0 0 0 -l1 ; 0 0 0 0 0 l1 0 0 0 0 -1 ];
beq = [IA ; 0 ; m4 ; m5 ; mD ; 0 ; 0 ; 0 ; 0 ; 0 ; 0];

% Estimate Phi via LSM
[Phi,resnorm,residual] = lsqlin(Psi_data,Tau_data,[],[],Aeq,beq,lb,ub);

syms ro1 ro2 ro6u ro6l

eq_theta1 = [IA + l1^2*(ro1*m1 + me) == Phi(1)]; % Eq. to find upper arms' mass dist. ratio \rho_1
Sro1 = double(solve(eq_theta1))                  % solution for \rho_1

eq_theta10 = [l1*(ro1*m1 + me) == Phi(10)];      
Sro11 = double(solve(eq_theta10));               % Should be same with the solution Sro1

eq_theta2 = [ l1^2*ro2*m2 == Phi(2)];            % Eq. to find forearms' mass dist. ratio \rho_2           
Sro2 = double(solve(eq_theta2))                  % solution for \rho_2

eq_theta6 = [ ro2*m2 == Phi(6) ];
Sro21 = double(solve(eq_theta6));                % Should be same with the solution Sro2

eq_theta11 = [ l1*ro2*m2 == Phi(11) ];
Sro22 = double(solve(eq_theta11));               % Should be same with the solution Sro2

eq_theta7 = [ ro6u*m6u == Phi(7) ];              % Eq. to find upper shafts' mass dist. ratio \rho_{6u}
Sro6u = double(solve(eq_theta7))                 % solution for \rho_{6u}

eq_theta8 = [ ro6l*m6l == Phi(8) ];              % Eq. to find lower shafts' mass dist. ratio \rho_{6l}
Sro6l = double(solve(eq_theta8))                 % solution for \rho_{6l}

eq_theta9 = [ ro6l*m6l == Phi(9) ];
Sro6l1 = double(solve(eq_theta9));               % Should be same with the solution Sro6l

% Reassign the estimated rho1, rho2, rho6u, rho6l for Simulink model
RL5_6kg_Dynamic_Param

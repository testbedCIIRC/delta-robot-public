%% This script is to plot TCP path, TCP and joint trajectories, and the sensed vs. calculated joint torques %%
close all 

% Plotting the TCP path in xyz-coordinates
figure(1)
plot3(TCP(:,1),TCP(:,2),TCP(:,3)),grid
title('Geometrical path of TCP (H point) in 3D Cartesian Space')
xlabel('$x$ [m]','Interpreter','latex')
ylabel('$y$ [m]','Interpreter','latex')
zlabel('$z$ [m]','Interpreter','latex')
set(gca,'fontsize', 12)
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% Plotting TCP trajectory
figure('units','normalized','position',[0.01 0.1 .98 .4])
figure(2)
subplot(1,3,1),plot(posH.time,posH.signals(1).values,'r',posH.time,TCP(:,1),'k--','linewidth',1),grid
legend({'$x_H$','$\bar{x}_H$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % 
axis([0 5.67 -0.4 0.28])
xlabel('[s]','Interpreter','latex','Fontsize',14)
ylabel('TCP trajectories: $H, \; \bar{H} \;$ [m]','Interpreter','latex') %,'Interpreter';'latex'
set(gca,'fontsize', 14,'XTick',(0:1:5)) 
set(gca,'LooseInset',get(gca,'TightInset'));
hold on 
subplot(1,3,2),plot(posH.time,posH.signals(2).values,'r',posH.time,TCP(:,2),'k--','linewidth',1),grid
legend({'$y_H$','$\bar{y}_H$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -0.5 0.7])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5)) 
set(gca,'LooseInset',get(gca,'TightInset'));
hold on 
subplot(1,3,3),plot(posH.time,posH.signals(3).values,'r',posH.time,TCP(:,3),'k--','linewidth',1),grid
legend({'$z_H$','$\bar{z}_H$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -1.21 -0.96])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-1.2:0.05:-1)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% Plotting joint trajectories
figure('units','normalized','position',[0.01 0.1 .98 .4])
figure(3)
subplot(1,5,1),plot(q_sensed.time,q_sensed.signals(1).values,'r',q_sensed.time,Qrad(:,1),'k--','linewidth',1),grid
legend({'$q_1$','$\bar{q}_1$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % 
axis([0 5.67 -0.8 0.3])
xlabel('[s]','Interpreter','latex','Fontsize',14)
ylabel('Joint coordinates: $q_i, \; \bar{q}_i \;$ [rad]','Interpreter','latex') %,'Interpreter';'latex'
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-0.8:0.2:0.3)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,2),plot(q_sensed.time,q_sensed.signals(2).values,'r',q_sensed.time,Qrad(:,2),'k--','linewidth',1),grid
legend({'$q_2$','$\bar{q}_2$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -0.4 0.7])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-0.4:0.2:0.7)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,3),plot(q_sensed.time,q_sensed.signals(3).values,'r',q_sensed.time,Qrad(:,3),'k--','linewidth',1),grid
legend({'$q_3$','$\bar{q}_3$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -0.7 0.9])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-0.6:0.2:0.8)) 
set(gca,'LooseInset',get(gca,'TightInset'));
subplot(1,5,4),plot(q_sensed.time,q_sensed.signals(4).values,'r',q_sensed.time,Qrad(:,4),'k--','linewidth',1),grid
legend({'$q_4$','$\bar{q}_4$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -2.6 1.2])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-2.4:0.4:1.2)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,5),plot(q_sensed.time,q_sensed.signals(5).values,'r',q_sensed.time,Qrad(:,5),'k--','linewidth',1),grid
legend({'$q_5$','$\bar{q}_5$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -1.7 2])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-1.6:0.4:2)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

tau_a.signals(1).values(1) = tau_a.signals(1).values(2);
tau_a.signals(2).values(1) = tau_a.signals(2).values(2);
tau_a.signals(3).values(1) = tau_a.signals(3).values(2);
tau_w.signals(1).values(1) = tau_w.signals(1).values(2);
tau_w.signals(2).values(1) = tau_w.signals(2).values(2);

% Plotting plotting sensed vs. calculated torque for upper arm drive joints
% and A4&A5 shaft drive joints
figure('units','normalized','position',[0.01 0.1 .98 .48])
figure(4)
subplot(1,5,1),plot(tau_a.time,tau_a.signals(:,1).values(:,1),'r',tau_a.time,tau_a.signals(:,1).values(:,2),'k--','linewidth',1),grid
legend({'$\tau_1$','$\bar{\tau}_1$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % 
axis([0 5.67 0 80])
xlabel('[s]','Interpreter','latex','Fontsize',14)
ylabel('Actuated joint torques: $\tau_i, \;\bar{\tau}_i \; $ [Nm]','Interpreter','latex') %,'Interpreter';'latex'
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(0:20:80)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,2),plot(tau_a.time,tau_a.signals(:,2).values(:,1),'r',tau_a.time,tau_a.signals(:,2).values(:,2),'k--','linewidth',1),grid
legend({'$\tau_2$','$\bar{\tau}_2$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 0 110])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(0:20:100)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,3),plot(tau_a.time,tau_a.signals(:,3).values(:,1),'r',tau_a.time,tau_a.signals(:,3).values(:,2),'k--','linewidth',1),grid
legend({'$\tau_3$','$\bar{\tau}_3$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 0 80])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(0:20:80)) 
set(gca,'LooseInset',get(gca,'TightInset'));
subplot(1,5,4),plot(tau_w.time,tau_w.signals(1).values(:,1),'r',tau_w.time,tau_w.signals(1).values(:,2),'k--','linewidth',1),grid
legend({'$\tau_4$','$\bar{\tau}_4$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -8 8.1])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-8:4:8)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,5,5),plot(tau_w.time,tau_w.signals(2).values(:,1),'r',tau_w.time,tau_w.signals(2).values(:,2),'k--','linewidth',1),grid
legend({'$\tau_5$','$\bar{\tau}_5$'},'Interpreter','latex','Orientation','horizontal','Fontsize',14) % ,'Fontsize',16
axis([0 5.67 -.4 .42])
xlabel('[s]','Interpreter','latex','Fontsize',14)
set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(-.4:0.2:0.4)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% Plotting calculated joint torque absolute errors 
e1 = abs(tau_a.signals(:,1).values(:,1)-tau_a.signals(:,1).values(:,2));
e2 = abs(tau_a.signals(:,2).values(:,1)-tau_a.signals(:,2).values(:,2));
e3 = abs(tau_a.signals(:,3).values(:,1)-tau_a.signals(:,3).values(:,2));
e4 = abs(tau_w.signals(:,1).values(:,1)-tau_w.signals(:,1).values(:,2));
e5 = abs(tau_w.signals(:,2).values(:,1)-tau_w.signals(:,2).values(:,2));
figure('units','normalized','position',[0.01 0.1 .98 .48])
figure(5)
plot(tau_a.time,e1,tau_a.time,e2,tau_a.time,e3,tau_a.time,e4,tau_a.time,e5,'linewidth',2),grid
legend({'$|\bar{e}_1|$','$|\bar{e}_2|$','$|\bar{e}_3|$','$|\bar{e}_4|$','$|\bar{e}_5|$'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % 
axis([0 5.67 0 1])
xlabel('[s]','Interpreter','latex','Fontsize',18)
ylabel('Joint torque errors: $|\bar{e}_i|, \;$ [Nm]','Interpreter','latex','Fontsize',18) %,'Interpreter';'latex'
set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(0:0.2:1)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% The RMSE for TCP (H) and Joint (q_i) Trajectories
exH = sqrt(mean((posH.signals(1).values-TCP(:,1)).^2))
eyH = sqrt(mean((posH.signals(2).values-TCP(:,2)).^2))
ezH = sqrt(mean((posH.signals(3).values-TCP(:,3)).^2))

eq1 = sqrt(mean((q_sensed.signals(1).values-Qrad(:,1)).^2))
eq2 = sqrt(mean((q_sensed.signals(2).values-Qrad(:,2)).^2))
eq3 = sqrt(mean((q_sensed.signals(3).values-Qrad(:,3)).^2))
eq4 = sqrt(mean((q_sensed.signals(4).values-Qrad(:,4)).^2))
eq5 = sqrt(mean((q_sensed.signals(5).values-Qrad(:,5)).^2))

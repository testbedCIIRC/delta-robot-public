% PLOTTING SENSED TORQUES 
close all 

% initial value correction
% torque_sensed.signals(1).values(1) = torque_sensed.signals(1).values(2);
% torque_sensed.signals(2).values(1) = torque_sensed.signals(2).values(2);
% torque_sensed.signals(3).values(1) = torque_sensed.signals(3).values(2);


% figure('units','normalized','position',[0.01 0.1 .98 .4])
% figure(1)
% subplot(1,3,1),plot(posH.time,posH.signals(1).values,'r',posH.time,posH.signals(1).values,'k--','linewidth',2),grid
% legend({'$x_H$','$\bar{x}_H$ [m]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % 
% axis([0 5.67 -0.4 0.28])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
% subplot(1,3,2),plot(posH.time,posH.signals(2).values,'r',posH.time,posH.signals(2).values,'k--','linewidth',2),grid
% legend({'$y_H$','$\bar{y}_H$ [m]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -0.5 0.7])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
% subplot(1,3,3),plot(posH.time,posH.signals(3).values,'r',posH.time,posH.signals(3).values,'k--','linewidth',2),grid
% legend({'$z_H$','$\bar{z}_H$ [m]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -1.21 -0.96])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-1.2:0.05:-1)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% set(gcf,'color','white')

%%%%%%%%%

% figure('units','normalized','position',[0.01 0.1 .98 .4])
% figure(1)
% subplot(1,5,1),plot(qall.time,qall.signals.values(:,1),'r',qall.time,qall.signals.values(:,1),'k--','linewidth',2),grid
% legend({'$q_1$','$\bar{q}_1$ [rad]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % 
% axis([0 5.67 -0.8 0.3])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-0.8:0.2:0.3)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% % hold on 
% subplot(1,5,2),plot(qall.time,qall.signals.values(:,2),'r',qall.time,qall.signals.values(:,2),'k--','linewidth',2),grid
% legend({'$q_2$','$\bar{q}_2$ [rad]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -0.4 0.7])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-0.4:0.2:0.7)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% % hold on 
% subplot(1,5,3),plot(qall.time,qall.signals.values(:,3),'r',qall.time,qall.signals.values(:,3),'k--','linewidth',2),grid
% legend({'$q_3$','$\bar{q}_3$ [rad]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -0.7 0.9])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-0.6:0.2:0.8)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% set(gcf,'color','white')
% subplot(1,5,4),plot(qall.time,qall.signals.values(:,4),'r',qall.time,qall.signals.values(:,4),'k--','linewidth',2),grid
% legend({'$q_4$','$\bar{q}_4$ [rad]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -2.6 1.2])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-2.4:0.4:1.2)) 
% set(gca,'LooseInset',get(gca,'TightInset'));
% % hold on 
% subplot(1,5,5),plot(qall.time,qall.signals.values(:,5),'r',qall.time,qall.signals.values(:,5),'k--','linewidth',2),grid
% legend({'$q_5$','$\bar{q}_5$ [rad]'},'Interpreter','latex','Orientation','horizontal','Fontsize',20) % ,'Fontsize',16
% axis([0 5.67 -1.7 2])
% xlabel('[s]')
% set(gca,'fontsize', 18,'XTick',(0:1:5),'YTick',(-1.6:0.4:2)) 
% set(gca,'LooseInset',get(gca,'TightInset'));


tau_a.signals(1).values(1) = tau_a.signals(1).values(2);
tau_a.signals(2).values(1) = tau_a.signals(2).values(2);
tau_a.signals(3).values(1) = tau_a.signals(3).values(2);

figure('units','normalized','position',[0.01 0.1 .98 .48])
figure(1)
subplot(1,3,1),plot(tau_a.time,tau_a.signals(:,1).values(:,1),'r',tau_a.time,tau_a.signals(:,1).values(:,2),'k',tau_a.time,tau_a.signals(:,1).values(:,3),'b','linewidth',1),grid
legend({'$\tau_1$','$\bar{\tau}_1$','$\tilde{\tau}_1$'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % 
axis([0 5.67 0 45])
xlabel('[s]','Interpreter','latex','Fontsize',16)
ylabel('Actuated joint torques: $\tau_i, \;\bar{\tau}_i , \;\tilde{\tau}_i \; $ [Nm]','Interpreter','latex','Fontsize',16) %,'Interpreter';'latex'set(gca,'fontsize', 14,'XTick',(0:1:5),'YTick',(0:10:45)) 
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:10:45)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,3,2),plot(tau_a.time,tau_a.signals(:,2).values(:,1),'r',tau_a.time,tau_a.signals(:,2).values(:,2),'k',tau_a.time,tau_a.signals(:,2).values(:,3),'b','linewidth',1),grid
legend({'$\tau_2$','$\bar{\tau}_2$','$\tilde{\tau}_2$'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 5.67 0 45])
xlabel('[s]','Interpreter','latex','Fontsize',16)
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:10:45)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,3,3),plot(tau_a.time,tau_a.signals(:,3).values(:,1),'r',tau_a.time,tau_a.signals(:,3).values(:,2),'k',tau_a.time,tau_a.signals(:,3).values(:,3),'b','linewidth',1),grid
legend({'$\tau_3$','$\bar{\tau}_3$','$\tilde{\tau}_3$'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 5.67 0 45])
xlabel('[s]','Interpreter','latex','Fontsize',16)
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:10:45)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% Plotting calculated upper arm joint torque absolute errors 

e1 = abs([tau_a.signals(:,1).values(:,1)-tau_a.signals(:,1).values(:,2) , tau_a.signals(:,1).values(:,1)-tau_a.signals(:,1).values(:,3)]);
e2 = abs([tau_a.signals(:,2).values(:,1)-tau_a.signals(:,2).values(:,2) , tau_a.signals(:,2).values(:,1)-tau_a.signals(:,2).values(:,3)]);
e3 = abs([tau_a.signals(:,3).values(:,1)-tau_a.signals(:,3).values(:,2) , tau_a.signals(:,3).values(:,1)-tau_a.signals(:,3).values(:,3)]);
figure('units','normalized','position',[0.01 0.1 .98 .48])
figure(2)
% plot(tau_a.time,e1,tau_a.time,e2,tau_a.time,e3,'linewidth',2),grid
subplot(1,3,1),plot(tau_a.time,e1(:,1),'k',tau_a.time,e1(:,2),'b','linewidth',1),grid
legend({'$|\bar{e}_1|$','$|\tilde{e}_2|$'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % 
axis([0 5.67 0 5])
xlabel('[s]','Interpreter','latex','Fontsize',16)
ylabel('Joint torque errors: $|\bar{e}_i|,\, |\tilde{e}_i|,\;$ [Nm]','Interpreter','latex','Fontsize',18) %,'Interpreter';'latex'
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:1:5)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')
% hold on 
subplot(1,3,2),plot(tau_a.time,e2(:,1),'k',tau_a.time,e2(:,2),'b','linewidth',1),grid
legend({'$|\bar{e}_1|$','$|\tilde{e}_1|$'},'Interpreter','latex','Orientation','horizontal','Fontsize',16) % axis([0 0 0 5])
axis([0 5.67 0 7])
xlabel('[s]','Interpreter','latex','Fontsize',16)
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:1:7)) 
set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
subplot(1,3,3),plot(tau_a.time,e3(:,1),'k',tau_a.time,e3(:,2),'b','linewidth',1),grid
legend({'$|\bar{e}_1|$','$|\tilde{e}_1|$'},'Interpreter','latex','Orientation','horizontal','Fontsize',16) % 
axis([0 5.67 0 6])
xlabel('[s]','Interpreter','latex','Fontsize',16)
set(gca,'fontsize', 16,'XTick',(0:1:5),'YTick',(0:1:6)) 
set(gca,'LooseInset',get(gca,'TightInset'));
set(gcf,'color','white')

% figure(2)
% subplot(3,1,1),plot(torque_sensed.time,torque_sensed.signals(1).values,'r','linewidth',2),grid
% ylabel('$\tau_1(t)$','Interpreter','latex') % ,'Fontsize',16
% axis(D+[0 0 0 10])
% set(gca,'fontsize', 16) %,,(0:2:12),'YTick',(0:2:12))
% set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
% subplot(3,1,2),plot(torque_sensed.time,torque_sensed.signals(2).values,'r','linewidth',2),grid
% ylabel('$\tau_2(t)$','Interpreter','latex')% ,'Fontsize',16
% axis(D)
% set(gca,'fontsize', 16) %,,(0:2:12),'YTick',(0:2:12))
% set(gca,'LooseInset',get(gca,'TightInset'));
% hold on 
% subplot(3,1,3),plot(torque_sensed.time,torque_sensed.signals(3).values,'r','linewidth',2),grid
% xlabel('$t$ (seconds)','Interpreter','latex'),ylabel('$\tau_3(t)$','Interpreter','latex') % ,'Fontsize',16
% axis(D)
% set(gca,'fontsize', 16) %,,(0:2:12),'YTick',(0:2:12))
% set(gca,'LooseInset',get(gca,'TightInset'));
% set(gcf,'color','white')
% 
% ax = gcf;
% exportgraphics(ax,'myplot.eps','Resolution',300);

% figure(1)
% set(gca,'LooseInset',get(gca,'TightInset'));

% plot3(posH.signals(1).values,posH.signals(2).values,posH.signals(3).values),grid
% xlabel('$x$ [m]','Interpreter','latex')
% ylabel('$y$ [m]','Interpreter','latex')
% zlabel('$z$ [m]','Interpreter','latex')

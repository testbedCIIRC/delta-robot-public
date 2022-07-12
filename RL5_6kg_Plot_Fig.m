%% This script is to plot geometrical TCP path and the sensed vs. calculated joint torques %%

close all 
samp = size(tau_a.time,1);
dur = samp*0.001;
lb = [min(tau_a.signals(:,1).values(2:samp,1)), min(tau_a.signals(:,2).values(2:samp,1)), min(tau_a.signals(:,3).values(2:samp,1)), min(tau_w.signals(1).values(2:samp,1)), min(tau_w.signals(2).values(2:samp,2))];
ub = [max(tau_a.signals(:,1).values(2:samp,1)), max(tau_a.signals(:,2).values(2:samp,1)), max(tau_a.signals(:,3).values(2:samp,1)), max(tau_w.signals(1).values(2:samp,1)), max(tau_w.signals(2).values(2:samp,2))];


% plotting the TCP path in xyz-coordinates
figure(1)
plot3(posH.signals(1).values,posH.signals(2).values,posH.signals(3).values,'linewidth',1.5),grid
title('Geometrical path of TCP (H point) in 3D Cartesian Space')
xlabel('$x$ [m]','Interpreter','latex')
ylabel('$y$ [m]','Interpreter','latex')
zlabel('$z$ [m]','Interpreter','latex')
set(gca,'fontsize', 12) 
set(gcf,'color','white')

% plotting sensed vs. calculated torque for 1st upper arm drive joint
figure(2)
plot(tau_a.time(2:samp),tau_a.signals(:,1).values(2:samp,1),'r',tau_a.time(2:samp),tau_a.signals(:,1).values(2:samp,2),'k--','linewidth',2),grid
legend({'$\tau_1$','$\bar{\tau}_1$ [Nm]'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % 
axis([0 dur lb(1)-5 ub(1)+5])
xlabel('[s]')
set(gca,'fontsize', 14) 
set(gcf,'color','white')

% plotting sensed vs. calculated torque for 2nd upper arm drive joint
figure(3)
plot(tau_a.time(2:samp),tau_a.signals(:,2).values(2:samp,1),'r',tau_a.time(2:samp),tau_a.signals(:,2).values(2:samp,2),'k--','linewidth',2),grid
legend({'$\tau_2$','$\bar{\tau}_2$ [Nm]'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 dur lb(2)-5 ub(2)+5])
xlabel('[s]')
set(gca,'fontsize', 14) 
set(gcf,'color','white')

% plotting sensed vs. calculated torque for 3rd upper arm drive joint
figure(4)
plot(tau_a.time(2:samp),tau_a.signals(:,3).values(2:samp,1),'r',tau_a.time(2:samp),tau_a.signals(:,3).values(2:samp,2),'k--','linewidth',2),grid
legend({'$\tau_3$','$\bar{\tau}_3$ [Nm]'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 dur lb(3)-5 ub(3)+5])
xlabel('[s]')
set(gca,'fontsize', 14) 
set(gcf,'color','white')

% plotting sensed vs. calculated torque for A4 shaft drive joint
figure(5)
plot(tau_w.time(2:samp),tau_w.signals(1).values(2:samp,1),'r',tau_w.time(2:samp),tau_w.signals(1).values(2:samp,2),'k--','linewidth',2),grid
legend({'$\tau_4$','$\bar{\tau}_4$ [Nm]'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 dur lb(4)-0.2 ub(4)+0.2])
xlabel('[s]')
set(gca,'fontsize', 14) 
set(gcf,'color','white')

% plotting sensed vs. calculated torque for A5 shaft drive joint
figure(6)
plot(tau_w.time(2:samp),tau_w.signals(2).values(2:samp,1),'r',tau_w.time(2:samp),tau_w.signals(2).values(2:samp,2),'k--','linewidth',2),grid
legend({'$\tau_5$','$\bar{\tau}_5$ [Nm]'},'Interpreter','latex','Orientation','horizontal','Fontsize',18) % ,'Fontsize',16
axis([0 dur lb(5)-0.05 ub(5)+0.05])
xlabel('[s]')
set(gca,'fontsize', 14) 
set(gcf,'color','white')

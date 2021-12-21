clear all
close all
clc
x0=[0.1;0;0.01];
tspan=[0 45];
[t,x]=ode45('H_R_model', tspan, x0);
subplot(3,1,1)
plot(t,x(:,1),'b','LineWidth',1);
title('Membrane Potential Vs Time')
subplot(3,1,2)
plot(t,x(:,2),'g','LineWidth',1)
title('Recovery Current Vs Time')
subplot(3,1,3)
plot(t,x(:,3),'r','LineWidth',1)
title('Adoption Current Vs Time')
figure()
plot3(x(:,1),x(:,2),x(:,3))
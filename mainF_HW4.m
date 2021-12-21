clear all
close all
clc
x0=[1;1;1];
tspan=[0 100];
[t,x]=ode45('F_HW4', tspan, x0);
figure()
subplot(2,1,1)
plot(t,x(:,1),'b*','LineWidth',5);
subplot(2,1,2)
plot(t,x(:,2),'g*','LineWidth',5)

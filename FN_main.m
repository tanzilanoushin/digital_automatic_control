clear all
close all
clc
v0=[-1.5;-3/8];
tspan=[0 100];
[t,v]=ode45('F_N1', tspan, v0);
plot(t,v(:,1),'k*','LineWidth',5);
subplot(2,1,1)
plot(t,v(:,1));
subplot(2,1,2);
plot(t,v(:,2));
figure(2)
plot(v(:,1),v(:,2));


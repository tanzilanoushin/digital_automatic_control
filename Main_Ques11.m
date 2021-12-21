clear all
close all
clc
xi0=[0.1;0.1;0.1];
tspan=[0 1000];
[t,x]=ode45('Ques11', tspan, xi0);
figure()
plot(t,x(:,1),'k','LineWidth',2);

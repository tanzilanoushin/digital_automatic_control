clear all
close all
clc
xi0=[0.3;0;0.1];% making xio =0.1 , yio= 0,zio= 0.1 as a random number
tspan=[0 600];
[t,x]=ode45('Project2_Q1', tspan, xi0);
figure()
plot(t,x(:,1),'k','LineWidth',2);

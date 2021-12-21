clear all
close all
clc
xi0=[0.1;0;0.1];% making xio =0.1 , yio= 0,zio= 0.1 as a random number
tspan=[0 550];
[t,x]=ode45('F_test1', tspan, xi0);
figure()
plot(t,x(:,1),'k','LineWidth',2);

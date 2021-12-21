clear all

close all

clc

x0=[0.1;0;0.01];

tspan=[0 15];

[t,x]=ode45('F_test2', tspan, x0);

 

figure()

plot3(x(:,1),x(:,2),x(:,3))
clearvars;
close all;
clc;

x0= [0.1; 0.4; 0.6; 0.8];
tspan= [0 4];
[t,x]=ode45('functionmid',tspan,x0);

plot(t,x(:,1),'k');
hold on
plot(t,x(:,2),'r');
hold on
plot(t,x(:,3),'g');
hold on
plot(t,x(:,4),'y');
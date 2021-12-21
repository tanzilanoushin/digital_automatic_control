clearvars;
close all;
clc;

x0= [0.1; 0.2; 0.3; 0.4];
tspan= [0 5];
[t,x]=ode45('functionmid',tspan,x0);

plot(t,x(:,1),'r');
hold on
plot(t,x(:,2),'b');
hold on
plot(t,x(:,3),'y');
hold on
plot(t,x(:,4),'k');
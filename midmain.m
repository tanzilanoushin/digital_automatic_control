clearvars;
close all;
clc;

x0= [0.1; 0.2; 0.3; 0.4];
tspan= [0 50];
[t,x]=ode45('functionmid',tspan,x0);

plot(t,sin(x(:,1)),'r');
hold on
plot(t,sin(x(:,2)),'b');
hold on
plot(t,sin(x(:,3)),'y');
hold on
plot(t,sin(x(:,4)),'k');

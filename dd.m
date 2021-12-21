clearvars;
close all;
clc;

x0= [0.1; 0.2; 0.3; 0.4];
tspan= [0 50];
tspan1= [0 20];

[t,x]=ode45('functionmid',tspan,x0);
[t1,x1]=ode45('functionmid',tspan1,x0);
plot(t,sin(x(:,1)),'r');
hold on
plot(t,sin(x(:,2)),'b');
hold on
plot(t,sin(x(:,3)),'y');
hold on
plot(t,sin(x(:,4)),'k');
figure(2)
plot(t1,sin(x1(:,1)),'r');
hold on
plot(t1,sin(x1(:,2)),'b');
hold on
plot(t1,sin(x1(:,3)),'y');
hold on
plot(t1,sin(x1(:,4)),'k');


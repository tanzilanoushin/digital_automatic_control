clearvars;
close all;
clc;

x0= [0.1; 0.2; 0.3; 0.4];
tspan= [0 10];
tspan1= [0 100];

[t,x]=ode45('functionmid4',tspan,x0);
[t1,x1]=ode45('functionmid4',tspan1,x0);
plot(t,sin(x(:,1)),'g');
hold on
plot(t,sin(x(:,2)),'b');
hold on
plot(t,sin(x(:,3)),'k');
hold on
plot(t,sin(x(:,4)),'r');
figure(2)
plot(t1,sin(x1(:,1)),'g');
hold on
plot(t1,sin(x1(:,2)),'b');
hold on
plot(t1,sin(x1(:,3)),'k');
hold on
plot(t1,sin(x1(:,4)),'r');


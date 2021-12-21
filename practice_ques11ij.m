
clearvars;
close all;
clc;
 
x0= [randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1)];
tspan= [0 100];
[t,x]=ode45('quesij',tspan,x0);
 
plot(t,x(:,1),'r');
hold on
plot(t,x(:,4),'g');


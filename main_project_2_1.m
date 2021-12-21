%%

clearvars;
close all;
clc;

x0= [randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1)];
tspan= [0 200];
N=2;
[t,x]=ode45('project2_1',tspan,x0,N);
figure(1)
plot(t,x(:,1),'r');
hold on
plot(t,x(:,4),'g');
figure(2)
plot(x(:,1),x(:,4))
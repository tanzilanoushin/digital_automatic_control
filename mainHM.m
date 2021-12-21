clearvars;
close all;
clc;

x0= [0.1; 0.1];
tspan= [0 10];
[t,x]=ode45(@HM,tspan,x0);
figure();
plot(x(:,1),x(:,2), 'LineWidth', 2);
hold on 
V=x(:,1);
Z=V(10:end);
P=V(9:(end-1));
plot(Z,P, 'ko', 'LineWidth', 4)
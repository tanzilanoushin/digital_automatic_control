clear all
close all
clc
xi0=[0.1;0;0.1];% making xio =0.1 , yio= 0,zio= 0.1 as a random number
tspan=[0 550];
 
xj0=[0.1;0;0.1];% making xjo =0.1 , yjo= 0,zjo= 0.1 as a random number 
[t1,x1]=ode45('Ques12', tspan, xj0);
plot(t1,x1(:,1),'b','LineWidth',1);


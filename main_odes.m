% This script solves an N dimension Kuramoto model with ode45.

clear all;
close all;
clc;

%% Define the timespan, initial conditions, K, w, and solve the system.
t_start = 0;
t_end = 1000;
tspan = [t_start t_end];

% n controls the number of nodes in the Kuramoto model. 
n = 25;
K = 0.5;
w = 0.1 * rand(n,1);
init_cond = rand(n,1);

[t,y] = ode45(@(t,theta) odes(t, theta, K, w), tspan, init_cond);
figure
plot(t,y(:,1))
V=y(:,1);
Z1=V(2:end);
P1=V(1:(end-1));
figure
plot(Z1,P1)
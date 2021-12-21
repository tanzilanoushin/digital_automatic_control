clear all;
close all;
clc;

% Define ksoan or tspan and initial conditions
y0 = zeros(4,1);
tspan = 0:0.01:1000;

% Using ode45
[K,y] = ode45(@ode2,tspan,y0);

% Plot
figure;
hold on;
plot(K,y);
title("Neuronal Systems");
xlabel("K");
ylabel("dydt");
legend("Phase-Theta1","Phase-Theta2","Phase-Theta3","Phase-Theta4");
grid on;
hold off;

%t_span = 0:0.1:200;
% init = zeros(16);
%y0 = 0;
% [t,y] = ode45(odes, t_span, init);
%[t,y] = ode45(eqn, t_span, init);

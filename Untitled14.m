clear all;
close all;
clc;

% Define the tspan (kspan) and initial conditions of 0.
y0 = zeros(4,1);
tspan = 0:0.01:1000;

% Solve the system of ODEs.
[K,y] = ode45(@odes,tspan,y0);

% Plot the results from solving the system of ODEs.
figure;
hold on;
plot(K,y);
title("ODE System Solved");
xlabel("K");
ylabel("dydt");
legend("Theta1","Theta2","Theta3","Theta4");
grid on;
hold off;
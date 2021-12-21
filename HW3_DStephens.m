% Damien Stephens
% Digital Control Systems - HW3

clear;
close all;
clc;

J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

% Define the transfer function.
s = tf('s');
num = K;
den = (L*s + R) * (J*s + b) + K^2;
sys = num / den;
display(sys);

% Generate the discrete system.
Ts = 0.01;
sysd = c2d(sys, Ts);

% Launch the PID Tuner.
% pidTuner(sys, 'PID');
pidTuner(sysd, 'PID');



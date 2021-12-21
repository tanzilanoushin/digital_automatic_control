clear all;
close all;
clc;

s = tf('s');

NUM = 1;
DEN = ((0.5*s^2)+(6*s)+0.001);
continuousSystem = NUM/DEN

[C_pi,info] = pidtune(continuousSystem, 'PID');

Ts = 0.1;
discreteSystem = c2d(continuousSystem, Ts)
[C_pi,info] = pidtune(discreteSystem, 'PID')

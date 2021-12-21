clear all;
close all;
clc;

s = tf('s');

cNUM = 20*(s^2 + 3.2*s + 7.2)*(s^2 - 8*s + 400);
cDEN = (s + 7)*(s^2 - 1.2*s + 0.8)*(s^2 + 33*s + 700);
continuousSystem = cNUM/cDEN;
[C_pi,info] = pidtune(continuousSystem, 'PID');

Ts = 0.1;
discreteSystem = c2d(continuousSystem, Ts)
[C_pi,info] = pidtune(discreteSystem, 'PID')

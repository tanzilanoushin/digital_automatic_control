clear all;
close all;
clc;

s = tf('s');

NUM = 0.01;
DEN = ((0.005*s^2)+(0.06*s)+0.1001);
sys = NUM/DEN
[C_pi,info] = pidtune(sys, 'PID')
s = stepinfo(sys)


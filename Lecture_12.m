clear all
close all
clc
clearvars
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
NUM = K;
DEN = ((J*s+b)*(L*s+R)+K^2);
sys = NUM/DEN

Ts = 0.001;
sysd = c2d(sys, Ts)
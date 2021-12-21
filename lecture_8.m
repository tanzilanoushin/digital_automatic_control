clearvars;
close all;
clc;
Num = [0 1];
Den = [1 -2];
T=0.1;
sys=tf(Num, Den)
sysd=c2d(sys, T)
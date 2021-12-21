clear all
close all
clc
A=[-0.02];
B=[0.001];
C=[1];
D=0;
sys=ss(A,B,C,D)
sysd=c2d(sys,0.01)
abs(sysd.A)
Ts=[0.1 0.01 0.001]
E=[0.998 0.9998 1]
plot(Ts,E)
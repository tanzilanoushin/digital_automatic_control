clearvars;
clc;
close all;

A=[0 1; -5 -2];
B=[1;3];
C=[1 1];
D=0;

Ts=0.25;



sys=ss(A,B,C,D);

sysd=c2d(sys,Ts)

Ad=sysd.A
Bd=sysd.B
Cd=sysd.C
Dd=sysd.D


[NUM,DEN]=ss2tf(Ad,Bd,Cd,Dd)

L=eig(Ad)
z=roots(NUM)
p=roots(DEN)



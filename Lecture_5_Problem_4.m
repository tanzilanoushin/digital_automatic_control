clearvars;
clc;
close all;

A=[0 1; -2 -2];
B=[1;1];
C=[2 3];
D=0;

Ts=pi;



sys=ss(A,B,C,D);

sysd=c2d(sys,Ts);

Ad=sysd.A;
Bd=sysd.B;
Cd=sysd.C;
Dd=sysd.D;


[NUM,DEN]=ss2tf(Ad,Bd,Cd,Dd);

L=eig(Ad);
z=roots(NUM);
p=roots(DEN);



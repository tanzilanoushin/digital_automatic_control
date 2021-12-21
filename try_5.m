clc
clear all
close all
clearvars
A=[-2 0 0;1 0 1;0 -2 -2];
B=[1;0;1];
C=[1 -1 0];
D=0;
Ts = 0.1;
[NUMd,DENd]=ss2tf(A,B,C,D);
G = tf(NUMd,DENd)
sys=ss(A,B,C,D);
%Discrete time representation
sysd=c2d(sys,Ts)
%State space solution
Ad = sysd.A
Bd = sysd.B
Cd = sysd.C
Dd = sysd.D
[NUMd,DENd]=ss2tf(Ad,Bd,Cd,Dd)
syms z;
Num_r= round(NUMd,2);
Den_r=round(DENd,2);
Y = (poly2sym(Num_r,z))/(poly2sym(Den_r,z))
syms z;
y= iztrans(Y)


clc
clear all
close all
clear vars
A=[0 1;-2 -2];
B=[1;1];
C=[2 3];
D=0;
%convert to transfer function
syms u;
[NUM,DEN]=ss2tf(A,B,C,D)
num= round(NUM)
den=round(DEN)
tranf = poly2sym(num,u)/poly2sym(den,u)
%unit response
syms v;
step_in = laplace((0*v)+1)
out = step_in*tranf
v_out = ilaplace(out)
step(ss(A,B,C,D))

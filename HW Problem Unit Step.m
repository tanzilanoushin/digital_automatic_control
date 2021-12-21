clc
clear all
close all
clear vars
%1) Define A,B,C,D matrix in MATLAB
A=[0 1;-2 -2];
B=[1;1];
C=[2 3];
D=0;
%2) For Zero State  Response prepare transfer function
syms s;
[NUM,DEN]=ss2tf(A,B,C,D)
num_r= round(NUM)
den_r=round(DEN)
tranf = poly2sym(num_r,s)/poly2sym(den_r,s)
%3) Find zero state unit response
syms t
la_stp_in = laplace((0*t)+1)
la_out = la_stp_in*tranf
t_out = ilaplace(la_out)
step(ss(A,B,C,D))

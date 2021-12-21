clc;
clearvars;
close all;

A=[0 1/3 0; 0 -2 1; 0 -1/3 0];
B=[2/3; 0; 1/3];
C=[0 -2 1];
D=0;

[z,p,k] = ss2zp(A,B,C,D,1) 

[V,D]=eig(A)


%Problem 3
syms t;
expm(A*t)
XO=[1;1;1];

% zero input response

y=expm(A*t)*XO;


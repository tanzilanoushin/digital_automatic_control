clc;
clearvars;
close all;

A=[0 1/3 0; 0 -2 1; 0 -1/3 0];
B=[2/3; 0; 1/3];
C=[0 -2 1];
D=0;




%Problem 3
syms t;
expm(A*t)
XO=[1;1;1];

% zero input response

yzi=C*expm(A*t)*XO;

% zero state response
syms s;

G=(1/3) /(s^2+2*s+(1/3));

yzs=ilaplace(G)

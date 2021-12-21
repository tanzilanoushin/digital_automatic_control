clc;
clearvars;

%A=[0 1; -2 -3];
A=[0 1; 0 -2];

syms t;

ST=expm(A*t)
clearvars;
close all;
clc;

A=[0 1 0 0; 0 0 -1 0; 0 0 0 1; 0 0 5 0];
B=[0; 1; 0; -2];
C=[1 0 0 0];

D=0;

sys=ss(A,B,C,D);

rlocus(sys)

p=[-1.5+1i*0.5 -1.5-1i*0.5 -1+1i*1 -1-1i*1];

K=place(A,B,p)


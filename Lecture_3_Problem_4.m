clc;
clearvars;
close all;

NUM=[0 0 4 3];
DEN=[40 30 9 3];

[A,B,C,D]=tf2ss(NUM,DEN);

[V,D]=eig(A);


XO=[2;2;2];
syms t;

yzi=C*expm(A*t)*XO;



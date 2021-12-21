clearvars;
close all;
clc;

A=[1 2; 3 1];
B=[0;1];
C=[1 2];
K=[3 1];
D=0;

[V1,D1]=eig(A);

% Check the eigen values

[NUM, DEN]=ss2tf(A,B,C,D);

p=roots(DEN)

sys=ss(A,B,C,D);

rlocus(sys)


Af=A-B*K;

[Vf, Df]=eig(Af);

[NUMf, DENf]=ss2tf(Af,B,C,D);

pf=roots(DENf)





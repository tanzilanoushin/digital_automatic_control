clearvars;
close all;
clc;

A=[-1 4; 4 -1];
B=[1;1];
C=[1 1];
D=0;

co=ctrb(A,B);
r=rank(co);
[Abar,Bbar,Cbar]=ctrbf(A,B,C);




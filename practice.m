clearvars;
clc;
close all;
syms k;
g=k*(0.9).^k;
G=ztrans(g);
A=[0.9, 0, 2;0 1 1;0 0 1];
syms D;
D=eig(A);
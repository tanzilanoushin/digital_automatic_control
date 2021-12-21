clearvars;
close all;
clc;
A=[-2 3 0; 1 0 0; 0 1 0];
B=[1;0;0];
Co=ctrb(A,B);
r=rank(Co);
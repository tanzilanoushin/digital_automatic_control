clc
clear all
close all
clear vars
syms t;
B=[cos(t) sin(t) ; -sin(t) cos(t)];
C=[-sin(t) cos(t) ; -cos(t) -sin(t)];
A=inv(B)*C
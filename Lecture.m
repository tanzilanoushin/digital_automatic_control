clc
clear all
close all
clear vars
A=[0 1; -5 -2];
B=[1; 3];
C=[1 1];
D=[0];
[NUM, DEN]=ss2tf(A,B,C,D);
syms g;
g=tf(NUM,DEN);
syms gd;
gd=ztrans(g,0.25);
[A B C D]=tf2ss(NUM,DEN);
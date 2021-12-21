clearvars;
clc;
close all;

Ts=1;
NUM=[1 -2];
DEN=[1 2];
sys=tf(NUM,DEN);
sysd=c2d(sys,Ts);



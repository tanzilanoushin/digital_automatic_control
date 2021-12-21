clc
clear all
close all
clear vars
NUM=[-63.6667 -96.3333 -55 -25];
DEN=[1 71.6667 0 0];
sys=tf(NUM,DEN)
sysd=c2d(sys,0.1)

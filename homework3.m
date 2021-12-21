clc
clear all
close all
clear vars
%transfer function
DEN = [1 5 6 0];
NUM = [0 0 1 1];
G = tf(NUM,DEN)
%state space and eigen values
[A,B,C,D] = tf2ss(NUM,DEN)
[V,D]= eig(A)
%Plot 
subplot(2,1,1)
pzmap(G)
subplot(2,1,2)
impulse(G)

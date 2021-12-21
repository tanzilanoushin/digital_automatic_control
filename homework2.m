clc
clear all
close all
clear vars
%Transfer Function
DEN = [1 0 1];
NUM = [0 1 0];
G = tf(NUM,DEN)
%State Space 
[A,B,C,D] = tf2ss(NUM,DEN)
%Eigen Value
eig(A)
[V,D]= eig(A)
%Plot
subplot(2,1,1)
pzmap(G)
subplot(2,1,2)
impulse(G)


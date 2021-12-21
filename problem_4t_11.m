clear all
close all
clc
Xo=[1 1;2 1];
syms t
A=[(0.9*exp((-4)*t)+0.1*exp((-2)*t)) (0.8*exp((-4)*t)+0.2*exp((-2)*t));(0.01*exp((-4)*t)+0.99*exp((-2)*t)) (0.01*exp((-4)*t)+1.99*exp((-2)*t))]
Xinv=inv(Xo)
S=A*Xinv
st=inv(S)
df=[(-0.6*exp((-2)*t)-2.8*exp((-4)*t)) (-0.4*exp((-4)*t)+0.2*exp((-2)*t));(-5.98*exp((-2)*t)-0.04*exp((-4)*t)) (2*exp((-2)*t))]
Af=df*st

clearvars;
clc;
close all;

% Using z transform
syms n;

h=(1/2).^n;

H=ztrans(h);
x=(1).^n;
X=ztrans(x);

Y=H*X;

y=iztrans(Y);


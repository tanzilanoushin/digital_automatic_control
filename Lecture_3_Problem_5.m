clc;
clearvars;
close all;

syms s;

Y=(4*s+3)/((40*s^3+30*s^2+9*s+3)*(s+3));

y=ilaplace(Y);

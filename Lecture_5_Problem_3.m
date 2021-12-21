clearvars;
clc;
close all;
syms k;

g=k*(0.9).^k;

G=ztrans(g);

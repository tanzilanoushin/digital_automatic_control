clearvars;
clc;
close all;

% Using conv

n=[0:1:20];

h=(1/2).^n;
x=(1).^n;

y=conv(h,x);

subplot(3,1,1);
stem(h);
subplot(3,1,2);
stem(x);
subplot(3,1,3);
stem(y);

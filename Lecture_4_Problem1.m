clearvars;
close all;
clc;

%Problem 1, zero state response


n=[0:1:50];
x=(1/2).^n;

B=1;
A=[1 0.3 1];

y=filter(B,A,x);

subplot(2,1,1);
stem(x);
subplot(2,1,2);
stem(y);




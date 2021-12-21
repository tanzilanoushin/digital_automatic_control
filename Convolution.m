clearvars;
clc;
close all;

h=ones(11,1);
x=zeros(11,1);
x(4:8)=1;

subplot(3,1,1);
stem(h);
subplot(3,1,2);
stem(x);

y=conv(h,x);

subplot(3,1,3);
stem(y(1:11));



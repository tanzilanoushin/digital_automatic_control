clc;
clearvars;
close all;




a = 4;
N=100;

x=zeros(N+1,1);
x(1) = 0.02;

for i = 1:N
    x(i+1) = a * x(i)*(1 - x(i));
end

plot(x)
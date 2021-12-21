clear all
close all
clc
function [P1,f]= myfft(data,Fs)
% parameters
 
Y=fft(data);
L=length(data);
 
f = Fs*(0:(L/2))/L;
% Function
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
end 

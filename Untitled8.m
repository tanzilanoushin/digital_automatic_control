clear all
close all
clc
[ip, fs] = audioread('bass.wav');
plot(ip)
L=length(ip);
c=fft(ip);
%[P,f]=fourier(ip,100000);
P2 = abs(c);
P2_=(angle(c));
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure()
subplot(211)
plot(f,P1)
subplot(212)
plot(P2_)
%f = fs*(0:(L/2))/L;
%figure()
%plot(f,P1)

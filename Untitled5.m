clear all
close all
clc
Fs = 1000; T = 1/Fs;
L=1500;
t= (0:L-1)*T;
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S+ 2*randn(size(t));
figure(1);
plot(t,X)
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

figure(2);
[P,f]=fourier(S,Fs);


plot(P,f) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P(f)|')


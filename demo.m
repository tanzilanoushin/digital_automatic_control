clear all
close all
clc
fs = 1000;
t = 0:1/fs:1-1/fs;
x = cos(2*pi*100*t) + randn(size(t));
N = length(x);
y1=load('sp.txt');
fs1 =128;
plot(y1(:,2))
figure()
y=y1(:,2);
stft(y)
figure()
stft(y,fs1,'Window',kaiser(256,5),'OverlapLength',100,'FFTLength',512);
subplot(1,2,1)
stft(y,fs1,'Window', kaiser(16,5),'OverlapLength',2)
subplot(1,2,2)
stft(y,fs1,'Window', kaiser(16,5),'OverlapLength',10)
figure()
[s,f]=stft(y,fs1,'Window', hamming(128,'periodic'),'OverlapLength',10);
max(f)
[a,i]= max(abs(s));
figure()
subplot(2,1,1);
plot(a)
subplot(2,1,2);
plot(f(i))
size(f)
figure()
plot(abs(f(i)))
figure()
hist(abs(f(i)))
figure()
spectrogram(y)
clear all
close all
clc
% Parameters
ts = 0.333;
fs = 1/ts;
ps1=load('sr.txt');
fs1 =1.5;
t1 = ps1(:,1);
sg1 = ps1(:,2);
sz = size(ps1(:,1));

% Interpolation
t2 = t1(1):ts:t1(end);
sg2 = interp1(t1, sg1, t2);
figure(1)
stft(sg2)
figure(2)
stft(sg2,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s1,f1]=stft(sg2,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s2,f2] = stft(sg2);
max(f1)
[amp,index]= max(abs(s1));
figure(3)
subplot(2,1,1);
subplot(2,1,2);
plot(f1(index))
size(f1)
figure(4)
plot((f1(index)))
figure(5)
hist(abs(f1(index)))
figure(6)
plot(f2,abs(s2))
figure(7)
spectrogram(sg2)
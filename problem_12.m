clear all
close all
clc
% Parameters
ts = 0.333;
fs = 1/ts;
y1=load('sr.txt');
fs1 =1.5;
t1 = y1(:,1);
sg2 = y1(:,2);
q= size(y1(:,1));

% Interpolation
t2 = t1(1):ts:t1(end);
sg2 = interp1(t1, sg2, t2);
figure(1)
stft(sg2)
figure(2)
stft(sg2,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s,f]=stft(sg2,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s1,f1] = stft(sg2);
max(f)
[a,i]= max(abs(s));
figure(3)
subplot(2,1,1);
plot(a)
subplot(2,1,2);
plot(f(i))
size(f)
figure(4)
plot((f(i)))
figure(5)
hist(abs(f(i)))

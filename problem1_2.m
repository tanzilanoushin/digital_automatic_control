clear all
close all
clc
% Define the sampling time and sampling frequency.
ts = 0.333;% 3 hz
fs = 1/ts;
y1=load('sr.txt');
fs1 =1.5;
time = y1(:,1);
signal = y1(:,2);
q= size(y1(:,1));

% Interpolate the data.
timeI = time(1):ts:time(end);
signalI = interp1(time, signal, timeI);
figure(1)
stft(signalI)
figure(2)
stft(signalI,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s,f]=stft(signalI,fs,'Window',kaiser(10.57,5),'OverlapLength',8);
[s1,f1] = stft(signalI);
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

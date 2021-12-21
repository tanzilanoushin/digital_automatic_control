clear all
close all
clc
% Define the sampling time and sampling frequency.
ts = 0.01;
fs = 1/ts;
y1=load('sr.txt');
fs1 =3750;
time = y1(:,1);
signal = y1(:,2);
% Interpolate the data.
timeI = time(1):ts:time(end);
signalI = interp1(time, signal, timeI);

stft(signalI)
figure()
stft(signalI,fs1,'Window',kaiser(16,5),'OverlapLength',1);
[s,f]=stft(signalI);
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


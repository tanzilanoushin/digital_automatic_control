clear all
close all
clc
fs = 2000;
t = 0:1/fs:2-1/fs;
q = chirp(t-2,4,1/2,6,'quadratic',100,'convex').*exp(-4*(t-1).^2);
figure(1)
plot(t,q)
emd(q)
imf = emd(q,'Display',1);
figure()
hht(imf,fs,'FrequencyLimits',[0 20])
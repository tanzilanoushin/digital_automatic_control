clear all
close all
clc
f1=50;
f2=100;
fs=1000;
t=0:1:100;
S=sin(2*pi*(f1/fs)*t)+sin(2*pi*(f2/fs)*t);
plot(S)
m=50;
W=[0.01 0.14];
B=fir1(m,W);
xf= filter(B,1,S);
hold on
plot(xf)
[P ,f]=myfft(xf,fs)
figure()
plot(f,P)
[b,a] = butter(5,0.14)
xf1 = filter(1,a,S);
figure()
plot(xf1)
[P1,f1]=myfft(xf1,fs)
figure
plot(f1,P1)



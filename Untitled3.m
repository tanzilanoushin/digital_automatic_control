clc
X=load('sp.txt');
fs=128;%sampling frequency
s =stft( X(:,1));
l
plot(s)

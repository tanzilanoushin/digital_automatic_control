
clear all
close all
clc
%load 8 different segment files
eeg = load('testEEG.txt');
for i=1:8
  A=eeg((i-1)*640+1:i*640,1:1);
  i+1;
  A;

[P,f]=myfft(A,fs);
figure()
plot(f,P);
[maxvaly,idx] = max(P) 
maxvalx = f(idx)
max(f);
max(P);
end



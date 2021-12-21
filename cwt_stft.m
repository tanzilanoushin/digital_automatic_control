clearvars;
close all;
clc;


load sr.txt;

fs=5;  % resampling frequency at 5Hz

time=sr(:,1);
sig=sr(:,2);

timeI=[time(1):1/fs:time(end)];

sigI=interp1(time,sig,timeI);
sigD=sigI-mean(sigI);

[S,F,T] = stft(sigD,fs,'Window',hamming(128,'periodic'),'OverlapLength',100);

M=zeros(length(S),1);
FM=zeros(length(S),1);

for i=1:length(S)
    
    [M(i),loc]=max(abs(S(:,i)));
    FM(i)=abs(F(loc));
    
end

   

figure(1)
subplot(2,1,1)
plot(T+timeI(1),M)
ylabel('Predominant ampltude')
title(' STFT ');
subplot(2,1,2);
plot(T+timeI(1),FM)
ylabel('Predominant frequency (Hz)')
xlabel('time in seconds');



[wt,Fw]=cwt(sigD,'amor',fs);

Mw=zeros(length(wt),1);
FMw=zeros(length(wt),1);


for j=1:length(wt)
    
    [Mw(j),locw]=max(abs(wt(:,j)));
    FMw(j)=Fw(locw);
    
end


figure(2)
subplot(2,1,1)
plot(timeI,Mw)
ylabel('Predominant ampltude')
title(' CWT ');
subplot(2,1,2);
plot(timeI,FMw)
ylabel('Predominant frequency (Hz)')
xlabel('time in seconds');



    
function [P1,f]= MyFFT(data,Fs)
% setting the parameters,Sampling frequency, Length of signal,Sampling period, Time vector  
 
 
Y=fft(data);
L=length(data);
Fs = 128;    
T=1/Fs;
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
end 

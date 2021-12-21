function [f,P1]=fourier(d,fs)
%f2=21;
%f3=22;
%fs=10*f2;
%offset=0;
%amp=3.3;
%a= offset+ amp*sin (2*pi*(f1/fs)*t)+sin(2*pi*(f2/fs)*t);
%b=offset+ amp*sin (2*pi*(f1/fs)*t)+sin(2*pi*(f3/fs)*t);4
c=fft(d);
L=length(d);
f = fs*(0:(L/2))/L;
P2 = abs(c/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
end
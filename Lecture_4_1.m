clear all
close all
clc
tspan=1: 0.001: 100;
y=sin(2*pi*(50/1000)*tspan)+sin(2*pi*(100/1000)*tspan)
%z=sin(2*pi*7*tspan)+sin(2*pi*22*tspan)
plot(tspan, y)
%hold on
%plot(tspan, z)
%fs=10*22;
%n=1:500;
%f1=[7 21];
%y_1 = (sin(2*pi*7*n/fs)) + (sin(2*pi*21*n/fs));
 
%f2={7 22};
%y_2 = sin(2*pi*7*n/fs) + sin(2*pi*22*n/fs);

%plot(n, y_1);
%hold on
%plot(n, y_2);
%b = fir1(48,[0.01 0.15])
%xf=filter(b,1,y)
[b,a] = butter(10, [0.01 0.15])
xf=filter(b,a,y)
plot(xf)

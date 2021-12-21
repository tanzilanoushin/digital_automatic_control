close all
clear all
clc
%parameters
h=0.1;
xfinal=7;
a= 4;
f= @(x,y)a*y*(1-y);
y= 0.02;
x=0:h:7;
for i=1:ceil(xfinal/h)
    x(i+1)=x(i)+h;
    k1=f(x(i),y(i));
    k2=f(x(i)+0.5*h,y(i)+0.5*k1*h);
    k3=f(x(i)+0.5*h,y(i)+0.5*k2*h);
    k4=f(x(i)+ h,y(i)+ k3*h);
    y(i+1)=y(i)+h/6*(k1 + 2*k2 + 2*k3 + k4);
end
 %plot
 plot(x,y)
 xlabel('x')
 ylabel('y')
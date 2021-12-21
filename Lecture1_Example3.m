clc;
clearvars;
close all;



tspan = [0, 5];
y0 = 0.02;
a=1;
[t,y] = ode45(@(t,y) a*y*(1-y), tspan, y0);

plot(t,y)
xlabel('time');
ylabel('y');



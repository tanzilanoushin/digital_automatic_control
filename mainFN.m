clearvars;
close all;
clc;

Vo=[-1.5; -3/8];
tspan=[0 100];
[t,V]=ode45('FN',tspan,Vo);

figure(1)

subplot(2,1,1);
plot(t,V(:,1));
xlabel('time ');
ylabel('v(t)');

subplot(2,1,2);
plot(t,V(:,2));
xlabel('time ');
ylabel('r(t)');


figure(2)


plot(V(:,1),V(:,2));
xlabel('v(t) ');
ylabel('r(t)');

title('Phase Space Plot');

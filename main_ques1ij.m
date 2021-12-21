
clearvars;
close all;
clc;

x0= [randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1)];
tspan= [0 100];
[t,x]=ode45('ques1ij',tspan,x0);

plot(t,x(:,1),'r');
hold on
plot(t,x(:,4),'g');
figure()
plot(x(:,1),x(:,4))
A=hilbert(x(:,1));
figure()
plot(A)
figure()
plot(abs(A))
title('Xi')
hold on
plot(unwrap(angle(A)))

A_=hilbert(x(:,4));
hold on
plot(abs(A_),'g')

hold on
plot(unwrap(angle(A_)),'k')

[r,p]=corrcoef(x(:,1),x(:,4));
%r_list=[r_list r];
%p_list=[p_list p];

cohere=mscohere(x(:,1),x(:,4));
figure()
disp("Correlation Coefficient");
disp(r);
disp("P Value");
disp(p);
disp("Coherence");
figure()
plot(cohere);


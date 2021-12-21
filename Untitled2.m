clearvars;
close all;
clc;

x0= [randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1);randn(1,1);randn(1,1)];
tspan= [0 200];
[t,x]=ode45('project2_1',tspan,x0);

plot(t,x(:,1),'r');
hold on
plot(t,x(:,4),'g');
hold on
plot(t,x(:,7),'k');
figure()
plot(x(:,1),x(:,4))
A=hilbert(x(:,1));
figure()
plot(A)
title('hilbert of xi')
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
figure()
plot(A_)
title('hilbert of xj')
cor=xcorr(x(:,1),x(:,4));
figure()
plot(cor)
[c,lags] = xcorr(x(:,1),x(:,4),500,'normalized');
figure()
stem(lags,c)
[r,p]=corrcoef(x(:,1),x(:,4));
figure()
plot(r)
hold on
plot(p)
figure()
plot(mscohere(x(:,1),x(:,4)))


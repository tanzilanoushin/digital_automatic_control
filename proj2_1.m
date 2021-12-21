% Assignment 2 practice
% Assignment 2
clear all;
close all;
clc;
% initial conditions
yinitial = [randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1); randn(1,1) ];
%x0 = [3; 1; 2];
% timespan
timespan = [0 500];
%try K values from 0 to 50 in 0.1 increments
Kvalues = (0: 0.1: 100);

[Nrk, Nck] = size(Kvalues);
%test all K values and compute MSE for each K
 for i = 1: Nck
K = Kvalues(i);
[t,x] = ode45(@(t,X)FN(t, X, K), timespan, yinitial);
% find index in time vector where time is greater than t_skip
t_skip = 100; 
skipIdx = numel(t(1:find(t > t_skip,1))); % get index
xi=x(skipIdx:end,1);
yi=x(skipIdx:end,2);
zi=x(skipIdx:end,3);
xj=x(skipIdx:end,4);
yj=x(skipIdx:end,5);
zj=x(skipIdx:end,6);
 
xerr = xi - xj;
yerr = yi - yj;
zerr = zi - zj;
[Nr, Nc] = size(xerr);
MSEX =(1/Nr).*sum(xerr.^2); 
MSEY =(1/Nr).*sum(yerr.^2); 
MSEZ =(1/Nr).*sum(zerr.^2); 
 % store K and MSE for each iteration 
MSETABLE(i , :)= [K; MSEX; MSEY; MSEZ];
 end
 
 [mseMin, mseIdx] = min(MSETABLE,[],1);

 
 Kx = MSETABLE(mseIdx(2),1)
 Ky = MSETABLE(mseIdx(3),1)
 Kz = MSETABLE(mseIdx(4),1)

%K = (ix + iy + iz)/3
figure(1)
[t1,x1] = ode45(@(t,X)FN(t, X, Kx), timespan, yinitial);
subplot(3,1,1)
plot(t1,x1(:,1), t1, x1(:,4));
title('Plot x(t) using Kx as K value')
xlabel('Time t')
ylabel('x(t)')

subplot(3,1,2)
plot(t1,x1(:,2), t1, x1(:,5));
title('Plot y(t) using Kx as K value')
xlabel('Time t')
ylabel('y(t)')

subplot(3,1,3)
plot(t1,x1(:,3), t1, x1(:,6));
title('Plot z(t) using Kx as K value')
xlabel('Time t')
ylabel('z(t)')

%figure 2
figure(2)
[t2,x2] = ode45(@(t2,X)FN(t2, X, Ky), timespan, yinitial);
subplot(3,1,1)
plot(t2,x2(:,1), t2, x2(:,4));
title('Plot x(t) using Ky as K value')
xlabel('Time t')
ylabel('x(t)')

subplot(3,1,2)
plot(t2,x2(:,2), t2, x2(:,5));
title('Plot y(t) using Ky as K value')
xlabel('Time t')
ylabel('y(t)')

subplot(3,1,3)
plot(t2,x2(:,3), t2, x2(:,6));
title('Plot z(t) using Ky as K value')
xlabel('Time t')
ylabel('z(t)')

figure(3)
%figure 3
[t3,x3] = ode45(@(t3,X)FN(t, X, Kz), timespan, yinitial);
subplot(3,1,1)

plot(t3,x3(:,1), t3, x3(:,4));
title('Plot x(t) using Kz as K value')
xlabel('Time t')
ylabel('x(t)')

subplot(3,1,2)
plot(t3,x3(:,2), t3, x3(:,5));
title('Plot y(t) using Kz as K value')
xlabel('Time t')
ylabel('y(t)')

subplot(3,1,3)
plot(t3,x3(:,3), t3, x3(:,6));
title('Plot z(t) using Kz as K value')
xlabel('Time t')
ylabel('z(t)')

 figure(4)
%figure 4

subplot(3,1,1)

semilogy(MSETABLE(:,1), MSETABLE(:,2));
title('Plot MSE vs K using MSE of xi, xj')
xlabel('K value')
ylabel('MSE (xi, xj)')

subplot(3,1,2)
semilogy(MSETABLE(:,1), MSETABLE(:,3));
title('Plot MSE vs K using MSE of yi, yj')
xlabel('K value')
ylabel('MSE (yi, yj)')

subplot(3,1,3)
semilogy(MSETABLE(:,1), MSETABLE(:,4));
title('Plot MSE vs K using MSE of zi, zj')
xlabel('K value')
ylabel('MSE (zi, zj)')


function vdot = FN(t,X,K)
vdot = zeros(6,1);
b = 3.0;
r = 0.006;
xo = -1.67;
I= 2.8;
% x X(1)
% y X(2)
% z X(3)
% I additional parameter external current
% rate of cgange fuctions  x' y' z'
% Equations from paper "Parameter estimation in Hindmarsh-Rose neurons"
% Steur, E. (2006). Parameter estimation in Hindmarsh-Rose neurons. (DCT rapporten; Vol. 2006.073)
%x' = -x^3 + 3*x^2 + y + I - z;
%y' = 1 - 5*x^2 - y;
%z' = r*(s*(x - x0) -z)
 
vdot(1) = X(2) - (X(1).^3) + b.*(X(1).^2) - X(3) + I + K.*(X(4)  - X(1)); 
vdot(2) = 1 - 5.*(X(1).^2)- X(2);
vdot(3) = r.*(4.*(X(1)-xo)-X(3));
vdot(4) = X(5) - (X(4).^3) + b.*(X(4)^2) - X(6) + I + K.*(X(1) - X(4));
vdot(5) = 1 - 5.*(X(4).^2)  - X(5);
vdot(6) = r.*(4.*(X(4)- xo) - X(6));
end

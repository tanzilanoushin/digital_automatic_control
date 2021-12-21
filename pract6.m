clearvars;
close all;
clc;

x0= [0.1; 0.2; 0.3; 0.4];
tspan= [0 50];
tspan1= [0 20];

[t,x]=ode45('functionmid',tspan,x0);
[t1,x1]=ode45('functionmid',tspan1,x0);
plot(t,sin(x(:,1)),'r');
hold on
plot(t,sin(x(:,2)),'b');
hold on
plot(t,sin(x(:,3)),'y');
hold on
plot(t,sin(x(:,4)),'k');
figure(2)
plot(t1,sin(x1(:,1)),'r');
hold on
plot(t1,sin(x1(:,2)),'b');
hold on
plot(t1,sin(x1(:,3)),'y');
hold on
plot(t1,sin(x1(:,4)),'k');
figure()
plot(t,x(:,1),'r');
hold on
plot(t,x(:,2),'b');
hold on
plot(t,x(:,3),'y');
hold on
plot(t,x(:,4),'k');
figure()
plot(x(:,2),x(:,3),'r')
title('Phase plot between y and z')
xlabel('Y')
ylabel('Z')
hold on 
grid on
plot(x(:,2),x(:,4),'b')
title('Phase plot between y and z2')
xlabel('Y')
ylabel('Z2')
hold on
plot(x(:,3),x(:,4),'y')
title('Phase plot between z and Z2')
xlabel('Z')
ylabel('Z2')
%% First 
A=hilbert(x(:,1));
A_abs=abs(A);
A_angle= unwrap(angle(A));
%% Second
B=hilbert(x(:,2));
B_abs=abs(B);
B_angle= unwrap(angle(B));
%% Third
C=hilbert(x(:,3));
C_abs=abs(C);
C_angle= unwrap(angle(C));
%% Fourth
D=hilbert(x(:,4));
D_abs=abs(D);
D_angle= unwrap(angle(D));
%% Phase difference out of group
Ph_13=A_angle-C_angle;
Ph_14=A_angle-D_angle;
Ph_23=B_angle-C_angle;
Ph_24=B_angle-D_angle;
figure()
subplot(411)
plot(Ph_13);
title('Phase Difference Between 1 and 3');
subplot(412)
plot(Ph_14);
title('Phase Difference Between 1 and 4');
subplot(413)
plot(Ph_23);
title('Phase Difference Between 2 and 3');
subplot(414)
plot(Ph_24);
title('Phase Difference Between 2 and 4');
%% Phase difference in group
Ph_12=A_angle-B_angle;
Ph_34=C_angle-D_angle;
figure()
subplot(211)
plot(Ph_12);
title('Phase Difference Between 1 and 2');
subplot(212)
plot(Ph_24);
title('Phase Difference Between 3 and 4');
%% cross corelation
cor_12=xcorr(x(:,1),x(:,2),'normalized'); % 1 and 2
cor_13=xcorr(x(:,1),x(:,3),'normalized'); % 1 and 3
cor_14=xcorr(x(:,1),x(:,4),'normalized'); % 1 and 4
cor_23=xcorr(x(:,2),x(:,3),'normalized'); % 2 and 3
cor_24=xcorr(x(:,4),x(:,4),'normalized'); % 2 and 4
cor_34=xcorr(x(:,3),x(:,4),'normalized'); % 3 and 4
figure()
subplot(611)
plot(cor_12)
subplot(612)
plot(cor_13)
subplot(613)
plot(cor_14)
subplot(614)
plot(cor_23)
subplot(615)
plot(cor_24)
subplot(616)
plot(cor_34)
%% corelation coefficient
[r12,p12]=corrcoef(x(:,1),x(:,2));
[r13,p13]=corrcoef(x(:,1),x(:,3));
[r14,p14]=corrcoef(x(:,1),x(:,4));
[r23,p23]=corrcoef(x(:,2),x(:,3));
[r24,p24]=corrcoef(x(:,2),x(:,4));
[r34,p34]=corrcoef(x(:,3),x(:,4));
figure()
subplot(611)
plot(r12)
hold on
plot(p12)
subplot(612)
plot(r13);
hold on
plot(p13);
subplot(613)
plot(r14)
hold on
plot(p14)
subplot(614)
plot(r23)
hold on
plot(p23)
subplot(615)
plot(r24)
hold on
plot(p24)
subplot(616)
plot(r34)
hold on 
plot(p34)
%% Mean Square Coherance
cohr_12=mscohere(x(:,1),x(:,2));
cohr_13=mscohere(x(:,1),x(:,3));
cohr_14=mscohere(x(:,1),x(:,4));
cohr_23=mscohere(x(:,2),x(:,3));
cohr_24=mscohere(x(:,2),x(:,4));
cohr_34=mscohere(x(:,3),x(:,4));
figure()
subplot(611)
plot(cohr_12)
title('Mean Square Coherence between 1 and 2');
subplot(612)
plot(cohr_13)
title('Mean Square Coherence between 1 and 3');
subplot(613)
plot(cohr_14)
title('Mean Square Coherence between 1 and 4');
subplot(614)
plot(cohr_23)
title('Mean Square Coherence between 2 and 3');
subplot(615)
plot(cohr_24)
title('Mean Square Coherence between 2 and 4');
subplot(616)
plot(cohr_34)
title('Mean Square Coherence between 3 and 4');

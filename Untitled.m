PID controller design for continuous time systems:
clear all
close all
clc
clearvars
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor = K/((J*s+b)*(L*s+R)+K^2);
% Trying Gain 100 
Kp = 100;
C = pid(Kp);
%Getting closed-loop transfer function
sys_Cl_L = feedback(C*P_motor,1);
t = 0:0.01:5;
figure()
step(sys_Cl_L,t)
grid on 
title('Step Response with Proportional Control')
 
% trying small integral(for steady state error) and dervative (overshoot)
Kp = 75;
Ki = 1;
Kd = 1;
%system second assumption
C = pid(Kp,Ki,Kd);
sys_ClL2 = feedback(C*P_motor,1);
figure()
step(sys_ClL2,[0:1:200])
grid on
title('PID Control after introduction of initial Ki and Kd')
 
%adjusting integral to improve steady state 
Kp = 100;
Ki = 200;
Kd = 1;
% system for third assumption
C = pid(Kp,Ki,Kd);
sys_ClL_3 = feedback(C*P_motor,1);
figure()
step(sys_ClL_3, 0:0.01:4)
grid on
title('PID Control with increased Ki')
%adjusitng overshoot
Kp = 100;
Ki = 200;
Kd = 10;
C = pid(Kp,Ki,Kd);
%system for fourth assumption
sys_ClL_4 = feedback(C*P_motor,1);
figure()
step(sys_ClL_4, 0:0.01:4)
grid on
title('PID Control with modified Kd')
sys_ClL_4

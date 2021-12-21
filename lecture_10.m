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
g = K/((J*s+b)*(L*s+R)+K^2);
%Closed-loop transfer_function
Kp = 100;
Cs = pid(Kp);
sys_Cl = feedback(Cs*g,1);
t = 0:0.01:5;
figure()
step(sys_Cl,t);
%Final design with P I D controller
Kp = 110;
Ki = 200;
Kd = 10;
Cs = pid(Kp,Ki,Kd);
sys_pid = feedback(Cs*g,1)
figure()
step(sys_pid, 0:0.01:5);
%Discrete System
Ts=0.1;
sysd=c2d(sys_Cl,Ts)
z=tf('s');
%Discrete closed-loop transfer function
Kp_cl = 1000;
Cd = pid(Kp_cl);
sys_Cl_d = feedback(Cd*tranf,1);
t = 0:0.01:5;
figure()
step(sys_Cl_d,t)
%Final design with P I D controller
Kpd = 1000;
Kid = 2000;
Kdd = 90;
Cd = pid(Kpd,Kid,Kdd);
sys_ClL_4 = feedback(Cd*g,1);
step(sys_ClL_4, 0:0.01:5)


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
sys_Cl = feedback(Cs*g,1);
t = 0:0.01:5;
figure()
step(sys_Cl,t)
%Final design with PID controller
Kp = 100;
Ki = 200;
Kd = 10;
Cs = pid(Kp,Ki,Kd);
sys_pid = feedback(Cs*g,1)
figure()
step(sys_pid, 0:0.01:5)


clear all
close all
clc
clearvars
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
Ts=0.1;
s = tf('s');
g = K/((J*s+b)*(L*s+R)+K^2)
NUMc=[0 0 0.01];
DENc=[0.005 0.06 0.1001]
[A B C D]=tf2ss(NUMc,DENc)
sys=ss(A,B,C,D)
sysd=c2d(sys,Ts)
[NUMd,DENd]=ss2tf(sysd.A,sysd.B,sysd.C,sysd.D)
z=tf('s');
tranfz=(0.0069*s+0.0046)/(s^2-1.1865*s+0.3012)
% Getting closed-loop transfer function
Kp = 1000;
Cd_Cl = pid(Kp);
sys_Cl_L = feedback(Cd_Cl*tranfz,1);
t = 0:0.01:5;
step(sys_Cl_L,t)
%Final design with P I D controller
Kpd = 1000;
Kid = 2000;
Kdd = 100;
C = pid(Kpd,Kid,Kdd);
sys_df = feedback(C*g,1);
figure()
step(sys_df, 0:0.01:5)

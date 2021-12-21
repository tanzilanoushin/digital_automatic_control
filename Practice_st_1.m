clear all
close all
clc
J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2))
A = [0 1 0
    0 -b/J K/J
    0 -K/L -R/L];
B = [0 ; 0 ; 1/L];
C = [1 0 0];
D = [0];

motor_ss = ss(A,B,C,D)
syms t
ST=expm(A*t)
%P=[cos(t) sin(t);-sin(t) cos(t)]
%q=[-sin(t) cos(t);-cos(t) -sin(t)]
%r=inv(P)*q
P=[2*t 1;1 3*t]
q=[2 0;0 3]
r=inv(P)*q
E=[0 3;2 0];
[V,D]=eig(E)
F=[1;0]
G=[0 1]
H=0
sys=ss(E,F,G,H)
rlocus(sys)
[NUM,DEN]=ss2tf(E,F,G,H)
sys1=tf(NUM,DEN)

clc
NUM=[0 2 2]
DEN=[1 2 1]
[A B C D]=tf2ss(NUM,DEN)
sys =ss(A,B,C,D)
T=0.5*pi
sysd=c2d(sys,T)
%check original systems stability controllability and observability 
eig(A)
figure()
impulse(sys)
hold on
impulse(sysd)
Co=ctrb(A,B)
r= rank(Co)
O=obsv(A,C)
rc=rank(O)
%check original discrete systems stability controllability and observability 
abs(eig(sysd.A))
Cod=ctrb(sysd.A,sysd.B)
rd= rank(Cod)
Od=obsv(sysd.A,sysd.C)
rcd=rank(Od)
%check original continuous and discrete systems root locus
figure()
rlocus(sys)
hold on
rlocus(sysd)
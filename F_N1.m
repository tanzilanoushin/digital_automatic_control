function vdot=F_N1(t,V)
%set parameters of the model
a=1.5; b=1; p=.08; I=0.3+0.1*randn(1,1);
vdot(1)=10*(V(1) - (V(1).^3)/3 - V(2)+I);
vdot(2)=p*(1.25*V(1)+a-b*V(2));
vdot=vdot';
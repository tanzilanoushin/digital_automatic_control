function xdot=F_HWW(t,x)
%set parameters of the model
a=2.10;
xdot(1)=x(2);
xdot(2)=x(3);
xdot(3)=(x(2))^2-a*x(3)-x(1);
xdot=xdot';

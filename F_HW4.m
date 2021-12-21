function xdot=F_HW4(t,x)
%set parameters of the model
a=2.10;
xdot(1)=x(2);
xdot(2)=x(3);
xdot(3)=xdot(1)-a*xdot(2)-x(1);
xdot=xdot';
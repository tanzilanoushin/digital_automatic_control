function xdot=F_test2(t,x)
%set parameters of the model
c=12;
a=0.1;
b=0.1;
xdot(1)=-x(2)-x(3);
xdot(2)=x(1)+a*x(2);
xdot(3)=b +x(3)*(x(1)-c);
xdot=xdot';

 


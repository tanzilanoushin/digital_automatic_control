function xdot=F_test2(t,x)
%set parameters of the model
b=3.0;
r= 0.006;
x0=-1.67;
I=2.8;
 
xdot(1)=x(2)-x(1).^3+b*x(1).^2-x(3)+I;% K=0
xdot(2)=1-5*x(1).^2-x(2);
xdot(3)=r*(4*(x(1)-x0)-x(3));
xdot=xdot';
end
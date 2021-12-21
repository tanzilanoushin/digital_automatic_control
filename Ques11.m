function xdot=Ques11(t,x)
%parameters
b=3.0;
r= 0.006;
x0=-1.67;
I=2.8;
xdot(1)=x(2)-x(1)+b*x(1).^2-x(3)+I;% K=0
xdot(2)=1-5*x(1).^2-x(2);
xdot(3)=r*(4*(x(1)-x0)-x(3));
xdot=xdot';
end

function xdot=ques11ij(t,x)

%parameters
b=3.0; 
r=0.006; 
xo=-1.67; 
K=0; 
m = mean(x(1),x(4));
xdot(1)= -x(2)-x(3)+K*m) ;
xdot(2)=x(1)+0.15*x(2);
xdot(3)=0.2+(x(3))*(x(1)-10);

xdot(4) = -1.015*(x(5))-x(6)+K*m);
xdot(5)= 1.015*x(4)+0.15*(x(5));
xdot(6)= 0.2+(x(6))*(x(4)-10);

xdot=xdot';
end

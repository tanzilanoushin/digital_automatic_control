function xdot=functionmid4(t,x)
%set parameters 

Kw=1.5;
Ka=-1.5;

xdot(1)= 0.26 + (Kw/2)*(sin(x(2)-x(1)))+(Ka/2)*(sin(x(3)-x(1))+sin(x(4)-x(1)));
xdot(2)= 0.26 + (Kw/2)*(sin(x(1)-x(2)))+(Ka/2)*(sin(x(3)-x(2))+sin(x(4)-x(2)));
xdot(3)= 0.26 + (Kw/2)*(sin(x(4)-x(3)))+(Ka/2)*(sin(x(1)-x(3))+sin(x(2)-x(3)));
xdot(4)= 0.26 + (Kw/2)*(sin(x(3)-x(4)))+(Ka/2)*(sin(x(1)-x(4))+sin(x(2)-x(4)));
xdot=xdot';
end
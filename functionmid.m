function xdot=functionmid(t,x)
%set parameters of the model

Kw=3;
Ka=-3;
xdot(1)= 0.26 +Kw*(sin(x(1)-x(1))+Kw*sin(x(2)-x(1))+Ka*sin(x(3)-x(1))+Ka*sin(x(4)-x(1)))/2;
xdot(2)= 0.26 + Kw*(sin(x(1)-x(2))+Kw*sin(x(2)-x(2))+Ka*sin(x(3)-x(2))+Ka*sin(x(4)-x(2)))/2;
xdot(3)= 0.26 + Ka*(sin(x(1)-x(3))+Ka*sin(x(2)-x(3))+Kw*sin(x(3)-x(3))+Kw*sin(x(4)-x(3)))/2;
xdot(4) = 0.26 + Ka*(sin(x(1)-x(4))+Ka*sin(x(2)-x(4))+Kw*sin(x(3)-x(4))+Kw*sin(x(4)-x(4)))/2;
xdot=xdot';
end
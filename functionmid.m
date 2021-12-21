function xdot=functionmid(t,x)
%set parameters of the model

K=3
xdot(1)= 0.26 + K*(sin(x(1)-x(1))+sin(x(2)-x(1))+sin(x(3)-x(1))+sin(x(4)-x(1)))/4;
xdot(2)= 0.24 + K*(sin(x(1)-x(2))+sin(x(2)-x(2))+sin(x(3)-x(2))+sin(x(4)-x(2)))/4;
xdot(3)= 0.27 + K*(sin(x(1)-x(3))+sin(x(2)-x(3))+sin(x(3)-x(3))+sin(x(4)-x(3)))/4;
xdot(4) = 0.25 + K*(sin(x(1)-x(4))+sin(x(2)-x(4))+sin(x(3)-x(4))+sin(x(4)-x(4)))/4;
xdot=xdot';
end
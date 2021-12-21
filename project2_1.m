function xdot=project2_1(t,x)

b=3.0; r=0.006; xo=-1.67; I=2.8;k =2;  

xdot(1)= x(2)-x(1).^3+b*x(1).^2-x(3)+I+k.*mean([x(4), x(1),x(7)]) ;
xdot(2)=1-5*x(1).^2-x(2);
xdot(3)= r*(4*(x(1)-xo)-x(3));
xdot(4) = x(5)-x(4).^3+b*x(4).^2-x(6)+I+k.*mean([ x(1),  x(4), x(7)]);
xdot(5)= 1-5*x(4).^2-x(5);
xdot(6)= r*(4*(x(4)-xo)-x(6));
xdot(7) = x(8)-x(7).^3+b*x(7).^2-x(9)+I+k.*mean([ x(1),  x(4), x(7)]);
xdot(8)= 1-5*x(7).^2-x(8);
xdot(9)= r*(4*(x(7)-xo)-x(9));
xdot=xdot';

end
function dxdt=HM(t,x)
dxdt(1)= x(2)  
dxdt(2)= -10*sin(x(1));
dxdt= dxdt';

end
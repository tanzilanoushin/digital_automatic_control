
function xdot=project2_1(t,x,N)

b=3.0; r=0.006; xo=-1.67; I=2.8;k =2; 
A = zeros(1,N);

 for x = 0:1:N
     for y = 1:1:N
         A(1,N)=x(1+3*N);
     end
     xdot(N+1)= x(N+2)-x(N+1).^3+b*x(N+1).^2-x(N+3)+I ;
     xdot(N+2)=1-5*x(N+1).^2-x(N+2);
     xdot(N+3)= r*(4*(x(N+1)-xo)-x(N+3));
 end
 


%xdot=xdot';

end
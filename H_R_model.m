function vdif=H_R_model(t,x)
% parameters
a=3; 
b=3.966; 
d=5.0128; 
u=0.005;
x0=-1.605;
f=0.03;
Adc=0;
PW_on_off=60;
A=10;
I=Adc+A*square(2*pi*f.*t,PW_on_off);
vdif(1)=x(2)+3*x(1).^2-x(1).^3-x(3)+I;
vdif(2)=1-d*x(1).^2-x(2);
vdif(3)=u*(b*(x(1)-x0)-x(3));
vdif=vdif';
end

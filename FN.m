function dVdt=FN(t,V)

% set parameters
a=1.5;
b=1;
p=0.08;
freq=10/200;
% here V(1) corresponds to v(t) and V(2) corresponds to  r(t)
offset=0;% Zero Offset
amp=3.3;%Constant Magnitude
duty=90;% Changing Dutycycle to 20, 40, 50, 80, 90, 100
I=offset+amp*square(2*pi*freq.*t,duty);% Duty Cycle varying current signal

dVdt(1)=10*(V(1)-(V(1).^3)/3-V(2)+I);   % this corresponds to dv/dt equation
dVdt(2)=p*(1.25*V(1)+a-b*V(2)); % this corresponds to dr/dt 
dVdt=dVdt';



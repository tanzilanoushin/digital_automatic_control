
function vdot = FN (t,v)
a=1.5;
b=1;
p=0.08;
I=1.5;
vdot (1) = 10* (V(1) - (V(1).^3)/ 3 -V(2)+I);
vdot (2) = p*(1.25*V(1)+a-b*V(2));
vdot=vdot';
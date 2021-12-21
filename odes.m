function dydt = odes(K,y)

dydt = zeros(4,1);
dydt(1) = 0.26 + (K/4) * (sin(y(1)-y(1)) + sin(y(2)-y(1)) + sin(y(3)-y(1)) + sin(y(4)-y(1)));
dydt(2) = 0.24 + (K/4) * (sin(y(1)-y(2)) + sin(y(2)-y(2)) + sin(y(3)-y(2)) + sin(y(4)-y(2)));
dydt(3) = 0.27 + (K/4) * (sin(y(1)-y(3)) + sin(y(2)-y(3)) + sin(y(3)-y(3)) + sin(y(4)-y(3)));
dydt(4) = 0.25 + (K/4) * (sin(y(1)-y(4)) + sin(y(2)-y(4)) + sin(y(3)-y(4)) + sin(y(4)-y(4)));

end
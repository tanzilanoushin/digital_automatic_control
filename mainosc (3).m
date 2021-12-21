
clearvars;
clc
close all;

N=input('Number of Oscillators   ');
K=0;
F= 7.11;
Omega=0.26+0.01*rand(N,1);

tspan = [0,200];
    xo = rand(N,1)*2*pi; %initial conditions between 0 to 2pi
    
    [t, phase] = ode45(@(t,x) osc(t,x,K,N,F,Omega), tspan, xo);
for i = 1:1:20

plot(t,phase(:,i));
hold on 
title('Time Vs Phase  ');
end
   r_y= sin(phase);
   figure()
   plot(t,r_y)
    
   c = 1;
for i=1:length(Omega)
    new_val = abs(mean(exp(i.*phase), 2))';
    row_size = length(new_val);
    r_t(c,1:row_size) = new_val;
    c = c + 1;
end
figure()
plot(t,r_t);
title('Time Vs Order Parameter')
figure()
surf(r_t);

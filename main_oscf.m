clearvars;
clc;
close all;

N=input('Number of Oscillators ');
K=0.1;
F=0.25;

Omega=0.26+0.01*randn(N,1);

tspan = [0,500];
    xo = rand(N,1)*2*pi; %initial conditions between 0 to 2pi
    
    [t, phase] = ode45(@(t,x) oscf(t,x,K,N,F,Omega), tspan, xo);
    
   hold on 
   OP = abs(mean(exp(1i*phase), 2))'
   plot(t,OP)
 
   
  
   
 


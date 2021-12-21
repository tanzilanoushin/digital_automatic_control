
clearvars;
clc;
close all;

N=input('Number of Oscillators   ');
K=0.1;

Omega=0.1+0.01*rand(N,1);

tspan = [0,2000];
    xo = rand(N,1)*2*pi; %initial conditions between 0 to 2pi
    
    [t, phase] = ode45(@(t,x) osc(t,x,K,N,Omega), tspan, xo);
    
    
   OP = abs(mean(exp(1i*phase), 2))'

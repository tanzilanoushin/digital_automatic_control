function f=osc(t,x,K,N,Omega)
 
f=Omega+(K/N)*sum(sin(x*ones(1,N)-(ones(N,1)*x')))';
 
end

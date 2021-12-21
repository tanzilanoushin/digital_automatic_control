%% Define the N dimension Kuramoto model.
function dydt = odes(t, theta, K, w)
    N = length(w);
    dydt = zeros(N,1);
    for x = 1:1:N
       dydt(x) = w(x) + (K/N) * sum((sin(theta - theta(x)))); 
    end
end
function xdot = syncques2(t,theta,K,w)
    
    theta_matrix = theta' - theta;
    xdot = w' + K/length(w).*sum(sin(theta_matrix), 2);
       

end
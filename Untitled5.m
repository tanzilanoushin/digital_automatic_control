clear all;
close all;
clc;

 y= load("first_trial1-1.txt");
 
 x = y(1:5010);
 H = [x(1:5000).'
     x(2:5001).'
     x(3:5002).'
     x(4:5003).'
     x(5:5004).'
     x(6:5005).'
     x(7:5006).'
     x(8:5007).'];
[u, s, v,] =svd(H,"econ");
figure()
subplot(3,1,1)
plot(v(:,1))
subplot(3,1,2)
plot(v(:,2))
subplot(3,1,3)
plot(v(:,3))
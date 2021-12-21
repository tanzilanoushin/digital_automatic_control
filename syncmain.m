clc;
clear;
close all;

K = 0.007;
w = [0.26, 0.24, 0.27, 0.25, 0.29, 0.23, 0.3, 0.28]; %omega values
 tspan = [0,500];
    x0= [0.1; 0.2; 0.3; 0.4; 0.01; 0.02; 0.03; 0.5];
    [t, x] = ode45(@(t,x) synccode(t,x, K, w), tspan, x0);


c = 1;
for i=1:length(w)
    new_val = abs(mean(exp(i.*x), 2))';
    row_size = length(new_val);
    r_t(c,1:row_size) = new_val
    c = c + 1;
end
figure(1)
plot(t,x(:,1),'r');
hold on
plot(t,x(:,2),'b');
hold on
plot(t,x(:,3),'y');
hold on
plot(t,x(:,4),'k');
hold on
plot(t,x(:,5),'g');
hold on
plot(t,x(:,6),'.');
hold on
plot(t,x(:,7),'*');
hold on
plot(t,x(:,8),'--');

figure(2)
surf(r_t);
ylabel("nth K value");
xlabel("nth time");
zlabel("r_t");


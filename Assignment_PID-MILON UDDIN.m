J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor = K/((J*s+b)*(L*s+R)+K^2);
% We at first try employing a proportional controller with a gain of 100, that is, C(s) = 100. To determine the closed-loop transfer function, we use the feedback command. 
Kp = 100;
C = pid(Kp);
sys_cl = feedback(C*P_motor,1);
t = 0:0.01:5;
         step(sys_cl,t)
         grid
         title('Step Response with Proportional Control')

%adding an integral term will eliminate the steady-state error to a step reference and a derivative term will often reduce the overshoot. Let's try a PID controller with small $K_i$ and $K_d$
Kp = 75;
Ki = 1;
Kd = 1;
C = pid(Kp,Ki,Kd);
sys_cl = feedback(C*P_motor,1);
step(sys_cl,[0:1:200])
title('PID Control with Small Ki and Small Kd')
%n this case, the long tail on the step response graph is due to the fact that the integral gain is small and, therefore, it takes a long time for the integral action to build up and eliminate the steady-state error. This process can be sped up by increasing the value of $K_i$
Kp = 100;
Ki = 200;
Kd = 1;
C = pid(Kp,Ki,Kd);
sys_cl = feedback(C*P_motor,1);
step(sys_cl, 0:0.01:4)
grid
title('PID Control with Large Ki and Small Kd')
% As expected, the steady-state error is now eliminated much more quickly than before. However, the large $K_i$ has greatly increased the overshoot. Let's increase $K_d$ in an attempt to reduce the overshoo
Kp = 100;
         Ki = 200;
         Kd = 10;
         C = pid(Kp,Ki,Kd);
         sys_cl = feedback(C*P_motor,1);
         step(sys_cl, 0:0.01:4)
         grid
         title('PID Control with Large Ki and Large Kd')
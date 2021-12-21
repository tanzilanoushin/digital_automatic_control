% Exam 2
% March 20, 2021

%% Problem 1

clear;
close all;
clc;

% Define the transfer function and get the state space representation.
num = [];
den = [];
[A,B,C,D] = tf2ss();
rankA = rank(A);

% Calculate the controllability matrix and find its rank.
CO = ctrb(A,B);
rankC0 = rank(C0);

% Display relevant stuff.
display(C0);
display(rankC0);
display(rankA);

% Determine if the system is controllable.
if (rankA == rankC0)
    fprintf("The system is fully controllable.\n");
else 
    fprintf("The system is not fully controllable.\n");
end

%% Problem 2

clear;
close all;
clc;

Ts = 0.1;

% Define the transfer function and get the state space representation.
num = [];
den = [];
[A,B,C,D] = tf2ss();

% Get the discretized system.
sys = ss(A,B,C,D);
sysd = c2d(sys, Ts);
Ad = sysd.A;
Bd = sysd.B;
Cd = sysd.C;
Dd = sysd.D;
rankAd = rank(Ad);

% Determine whether or not the system is controllable.
C0d = ctrb(Ad,Bd);
rank(C0d);

% Display relevant stuff.
display(C0d);
display(rankAd);
display(rankC0d);

% Determine if the system is controllable.
if (rankA == rankC0)
    fprintf("The system is fully controllable.\n");
else 
    fprintf("The system is not fully controllable.\n");
end

% Find any subsystem that is controllable.
[Abar,Bbar,Cbar,Dbar] = ctrbf(Ad,Bd,Cd,Dd);
display(Abar);
display(Bbar);

%% Problem 3

clear;
close all;
clc;

% Define the transfer function and get the state space representation.
num = [];
den = [];
[A,B,C,D] = tf2ss();

% Look at the root locus to analyze.
sys = ss(A,B,C,D);
rlocus(sys);

% Define where the poles should be placed and place them there.
P = [];
K = place(A,B,P);

%% Problem 4

clear;
close all;
clc;



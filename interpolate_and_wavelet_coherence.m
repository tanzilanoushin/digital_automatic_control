

clear all;
close all;
clc;

% Define the sampling frequency.
fs = 100;

%% Load the signals and separate the datasets.
signal_sr = load("sr.txt");
signal_sp = load("sp.txt");

% Extract the time axis.
t_sr = signal_sr(:,1);
t_sp = signal_sp(:,1);

% Generate uniform time axis based on the .
t_I = [t_sp(1):1/fs:t_sp(end)];

% Extract the signal value axis.
sig_sr = signal_sr(:,2);
sig_sp = signal_sp(:,2);

%% Interpolate the two signals.
I_sig_sr = interp1(t_sr, sig_sr, t_I, 'spline');
I_sig_sp = interp1(t_sp, sig_sp, t_I, 'spline');

%% Calculate the wavelet coherence and post-process results.
[wcoh, wcs, f] = wcoherence(I_sig_sr, I_sig_sp, fs);

% Post-process the results from wavelet coherence into time and frequency
% averages.
avg_wcoh_t = mean(wcoh);
avg_wcoh_f = mean(wcoh, 2);

%% Plot the results.

% Time average coherence
figure(1);
hold on;
plot(t_I, avg_wcoh_t);
xlabel("Time (s)");
ylabel("Coherence");
title("Time Average Coherence");
grid on;
hold off;

% Frequency average coherence
figure(2);
hold on;
plot(f, avg_wcoh_f);
xlabel("Frequency (Hz)");
ylabel("Coherence");
title("Frequency Average Coherence");
grid on;
hold off;
figure(3)
wcoherence(I_sig_sr, I_sig_sp, fs);

for i=1:3500
  A=X((i-1)*640+1:i*640,1:1);
  i+1;
  A;
 
[P,f]=MyFFT(A,Fs);
 
plot(f,P);
[maxvaly,idx] = max(P) 
maxvalx = f(idx)
max(f);
max(P);
end


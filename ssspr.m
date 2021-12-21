clear all;
close all;
clc;
% Define the sampling frequency.
fs = 100;
% Load the signals and separate the datasets
signal_sr = load("sr.txt");
signal_sp = load("sp.txt");
% Extract the time axis.
t_sr = signal_sr(:,1);
t_sp = signal_sp(:,1);
% Generate uniform time axis
t_I = [t_sp(1):1/fs:t_sp(end)];
% Extract the signal value axis
sig_sr = signal_sr(:,2);
sig_sp = signal_sp(:,2);
%% Interpolate the two signals.
I_sig_sr = interp1(t_sr, sig_sr, t_I, 'spline');
I_sig_sp = interp1(t_sp, sig_sp, t_I, 'spline');
% Hilbert
 HR = hilbert(I_sig_sr);
 PhR = angle(HR);
 HP = hilbert(I_sig_sp);
 PhP = angle(HP);
 uPhR = unwrap(PhR);
 uPhP = unwrap(PhP);
 figure(1)
 plot(uPhR-uPhP)
% Calculate the wavelet coherence and post-process results.
[wcoh, wcs, f] = wcoherence(I_sig_sr, I_sig_sp, fs);
% Post-process the results from wavelet coherence into time and frequency
% averages.
max_wcoh_t = max(wcoh);
% Time average coherence
figure(2);
hold on;
plot(t_I, max_wcoh_t);
xlabel("Time (s)");
ylabel("Coherence");
title("Time Maximum Coherence");
grid on;
hold off;
figure(3)
wcoherence(I_sig_sr, I_sig_sp, fs);
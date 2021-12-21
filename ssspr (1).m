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
sig_sr1 = signal_sr(:,2);
sig_sp1 = signal_sp(:,2);

%% Interpolate the two signals.
Interpolate_signal_sr = interp1(t_sr, sig_sr1, t_I, 'spline');
Interpolate_signal_sp = interp1(t_sp, sig_sp1, t_I, 'spline');
% Hilbert
 HR = hilbert(Interpolate_signal_sr);
 PhasehR = angle(HR);
 HP = hilbert(Interpolate_signal_sp);
 PhasehP = angle(HP);
 unwrapPhaseR = unwrap(PhasehR);
 unwrapPhasehP = unwrap(PhasehP);
 figure(1)
 plot(unwrapPhaseR-unwrapPhasehP)
% Wavelet coherence 
[wcoh, wcs, f] = wcoherence(Interpolate_signal_sr, Interpolate_signal_sp, fs);
% Wavelet coherence into time and frequency
max_wcoh_t = max(wcoh);
% Time average coherence
figure(2);
hold on;
plot(t_I, max_wcoh_t);
xlabel("Time");
ylabel("Coherence");
title("Time Vs. Maximum Coherence");
grid on;
hold off;
figure(3)
wcoherence(Interpolate_signal_sr, Interpolate_signal_sp, fs);

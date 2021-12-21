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

%% Generate uniform time axis based on the .
t_I = [t_sp(1):1/fs:t_sp(end)];

%% Extract the signal value axis.
sig_sr = signal_sr(:,2);
sig_sp = signal_sp(:,2);

%% Interpolate the two signals.
I_sig_sr = interp1(t_sr, sig_sr, t_I, 'spline');
I_sig_sp = interp1(t_sp, sig_sp, t_I, 'spline');


%% Hilbert Huang Transform
Rimf = emd(I_sig_sr,'Display',1);
Pimf = emd(I_sig_sp,'Display',1);
[Rhs,Rf,Rt]=hht(Rimf,fs);
[Phs,Pf,Pt]=hht(Pimf,fs);
%% Hilbert Huang Result for SR
Rhs_abs = abs(Rhs)./length(I_sig_sr);
[max_amp_nr,idx_nr] = max(Rhs_abs, [], 1);
corresponding_frequency = Rf(idx_nr);
figure(1)
subplot(211)
plot(max_amp_nr);
title("Max amp. of SR in HHT");
xlabel("Window Number");
ylabel("Maximum amplitude");
subplot(212)
stem(abs(Rf(idx_nr))); 
title("SR Corr. freq. of the max.amp.in HHT");
xlabel("Window Number");
ylabel("Corresponding Frequency");
%% Hilbert Huang Result for SP
Phs_abs = abs(Phs)./length(I_sig_sp);
[max_amp_np,idx_np] = max(Phs_abs, [], 1);
corresponding_frequency = Pf(idx_np);
figure()
subplot(211)
plot(max_amp_np);
title("Max amp. of SP in HHT");
xlabel("Window Number");
ylabel("Maximum amplitude");
subplot(212)
stem(abs(Pf(idx_np))); 
title("SP Corr. freq. of the max.amp.in HHT");
xlabel("Window Number");
ylabel("Corresponding Frequency");



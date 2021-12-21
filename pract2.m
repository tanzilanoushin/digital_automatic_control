clear all
close all
clc
load testEEG.txt;
signal=testEEG;
fs=128;
% Gamma greater than 35Hz
% Beta 12-35 Hz
% Alpha 8-12 Hz
% theta 4-8 Hz
% Delta 0.5-4 Hz
%% Intrinsic mode function making  and HHT
imf = emd(signal,'Display',1);
[hs,f,t] = hht(imf,fs);
hs_abs = abs(hs)./length(signal);
[max_amp_n,idx_n] = max(hs_abs, [], 1);
corresponding_frequency = f(idx_n);
figure(1)
plot(max_amp_n);
title("Max amp. of all windows in HHT");
xlabel("Window Number");
ylabel("Maximum amplitude");
figure()
stem(abs(f(idx_n))); 
title("Corr. freq. of the max.amp.in STFT in. Mean");
xlabel("Window Number");
ylabel("Corresponding Frequency");
% Generate the time series.
t = (0:1:length(signal)-1) * (1/fs);
figure(2)
hht(imf,fs)
figure()
hht(imf,fs,'FrequencyLimits',[4 8])
%% Find the locations of the freuency ranges.
loc_Gamma = find(f > 35);
loc_Beta  = find((f >= 12) & (f < 35));
loc_Alpha = find((f >= 8) & (f < 12));
loc_Theta = find((f >= 4) & (f < 8));
loc_Delta = find((f > 0.5) & (f < 4));
%% Get the frequencies at the found locations.
f_Gamma = f(loc_Gamma);
f_Beta  = f(loc_Beta);
f_Alpha = f(loc_Alpha);
f_Theta = f(loc_Theta);
f_Delta = f(loc_Delta);
H_Gamma = hs(loc_Gamma,:);
H_Beta  = hs(loc_Beta,:);
H_Alpha = hs(loc_Alpha,:);
H_Theta = hs(loc_Theta,:);
H_Delta = hs(loc_Delta,:);
%%



clear all;
close all;
clc;
 
%% Begin data processing.
 
% Load the signal from the file.
signal = load("testEEG.txt");
 
% Specify the sampling frequency.
fs = 128;
 
% Apply the wavelet.
[W,f] = cwt(signal, 'amor', fs);
 
% Generate the time series.
t = (0:1:length(signal)-1) * (1/fs);
 
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
 
W_Gamma = W(loc_Gamma,:);
W_Beta  = W(loc_Beta,:);
W_Alpha = W(loc_Alpha,:);
W_Theta = W(loc_Theta,:);
W_Delta = W(loc_Delta,:);
 
%% Extract the time-frequency ridges.
[fridgeGamma, iridgeGamma, lridgeGamma] = tfridge(abs(W_Gamma), f_Gamma);
[fridgeBeta,  iridgeBeta,  lridgeBeta]  = tfridge(abs(W_Beta),  f_Beta);
[fridgeAlpha, iridgeAlpha, lridgeAlpha] = tfridge(abs(W_Alpha), f_Alpha);
[fridgeTheta, iridgeTheta, lridgeTheta] = tfridge(abs(W_Theta), f_Theta);
[fridgeDelta, iridgeDelta, lridgeDelta] = tfridge(abs(W_Delta), f_Delta);
 
%% Plot the predominant frequencies and amplitudes.
ylabel_text_f = "Predominant Frequency (Hz)";
ylabel_text_A = "Predominant Amplitude (mV)";
xlabel_text = "Time (s)";
 
% Gamma
figure(1);
hold on;
subplot(2,1,1);
plot(t, fridgeGamma);
ylabel(ylabel_text_f)
title("Gamma");
subplot(2,1,2);
plot(t, abs(W_Gamma(lridgeGamma)));
xlabel(xlabel_text);
ylabel(ylabel_text_A);
grid on;
hold off;
 
% Beta
figure(2);
hold on;
subplot(2,1,1);
plot(t, fridgeBeta);
ylabel(ylabel_text_f)
title("Beta");
subplot(2,1,2);
plot(t, abs(W_Beta(lridgeBeta)));
xlabel(xlabel_text);
ylabel(ylabel_text_A);
grid on;
hold off;
 
% Alpha
figure(3);
hold on;
subplot(2,1,1);
plot(t, fridgeAlpha);
ylabel(ylabel_text_f)
title("Alpha");
subplot(2,1,2);
plot(t, abs(W_Alpha(lridgeAlpha)));
xlabel(xlabel_text);
ylabel(ylabel_text_A);
grid on;
hold off;
 
% Theta
figure(4);
hold on;
subplot(2,1,1);
plot(t, fridgeTheta);
ylabel(ylabel_text_f)
title("Theta");
subplot(2,1,2);
plot(t, abs(W_Theta(lridgeTheta)));
xlabel(xlabel_text);
ylabel(ylabel_text_A);
grid on;
hold off;
 
% Delta
figure(5);
hold on;
subplot(2,1,1);
plot(t, fridgeDelta);
ylabel(ylabel_text_f)
title("Delta");
subplot(2,1,2);
plot(t, abs(W_Delta(lridgeDelta)));
xlabel(xlabel_text);
ylabel(ylabel_text_A);
grid on;
hold off;

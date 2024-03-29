% Damien Stephens
% Problem 1

clear all;
close all;
clc;

% Define the sampling time and sampling frequency.
ts = 0.01;
fs = 1/ts;

% Load the data from the given file.
load sr.txt

% Separate the columns into two arrays.
time = sr(:,1);
signal = sr(:,2);

% Interpolate the data.
timeI = time(1):ts:time(end);
signalI = interp1(time, signal, timeI);

% Visualize the original and interpolated data overlayed.
figure;

plot(time, signal, 'b');
hold on;
plot(timeI, signalI, 'r');
grid on;
title('SR Data and Interpolated SR Data');
legend('Original', 'Resampled');
hold off;

% Calculate the PSD using the wavelet.
figure()
wt = cwt(signalI,fs);

% Use cwt to visualize with the wavelet scalogram.
figure()
cwt(signalI, fs);

% figure
% plot(timeI, wt);
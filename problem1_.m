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
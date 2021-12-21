%q2

clear all;
close all;
clc;

fileID = fopen('testEEG.txt','r');
formatSpec = '%e'; %float exponential
EEG = fscanf(fileID,formatSpec);
fclose(fileID);
N1 = 641
N2 = N1+640;
N3 = N2+640;
N4 = N3+640;
N5 = N4+640;
N6 = N5+640;
N7 = N6+640;
N8 = N7+640;
TOTAL_SAMPLES = length(EEG);
TOTAL_EEG_TIME = 40; %given
fs = round(TOTAL_SAMPLES/TOTAL_EEG_TIME,0)
T = 1/fs; %sample period
TIME = (0: TOTAL_SAMPLES-1).*T;

EEG1 = EEG(1:N1);
EEG2 = EEG(N1+1:N2);
EEG3 = EEG(N2+1:N3);
EEG4 = EEG(N3+1:N4);
EEG5 = EEG(N4+1:N5);
EEG6 = EEG(N5+1:N6);
EEG7 = EEG(N6+1:N7);
EEG8= EEG(N7+1:N8);

TIME1 = TIME(1:N1);
TIME2 = TIME(N1+1:N2);
TIME3 = TIME(N2+1:N3);
TIME4 = TIME(N3+1:N4);
TIME5 = TIME(N4+1:N5);
TIME6 = TIME(N5+1:N6);
TIME7 = TIME(N6+1:N7);
TIME8 = TIME(N7+1:N8);



[freq1, fftData1] = fftData(EEG1, fs);
[freq2, fftData2] = fftData(EEG2, fs);
[freq3, fftData3] = fftData(EEG3, fs);
[freq4, fftData4] = fftData(EEG4, fs);
[freq5, fftData5] = fftData(EEG5, fs);
[freq6, fftData6] = fftData(EEG6, fs);
[freq7, fftData7] = fftData(EEG6, fs);
[freq8, fftData8] = fftData(EEG6, fs);


[maxamp1, aidx1] = max(EEG1);
[maxamp2, aidx2] = max(EEG2);
[maxamp3, aidx3] = max(EEG3);
[maxamp4, aidx4] = max(EEG4);
[maxamp5, aidx5] = max(EEG5);
[maxamp6, aidx6] = max(EEG6);
[maxamp7, aidx7] = max(EEG7);
[maxamp8, aidx8] = max(EEG8);

maxAmp = [maxamp1; maxamp2; maxamp3; maxamp4; maxamp5; maxamp6; maxamp7; maxamp8];

[maxfreq1, fidx1] = max(fftData1);
[maxfreq2, fidx2] = max(fftData2);
[maxfreq3, fidx3] = max(fftData3);
[maxfreq4, fidx4] = max(fftData4);
[maxfreq5, fidx5] = max(fftData5);
[maxfreq6, fidx6] = max(fftData6);
[maxfreq7, fidx7] = max(fftData7);
[maxfreq8, fidx8] = max(fftData8);

maxfreq = [freq1(fidx1); freq2(fidx2); freq3(fidx3);freq4(fidx4); freq5(fidx5); freq6(fidx6); freq7(fidx7); freq8(fidx8)];

%a
figure(1)
stem(maxAmp)
title('Maximum Amplitude')
xlabel('Window')
ylabel('Amplitude')

%a
figure(2)
stem(maxfreq)
title('Maximum Frequency')
xlabel('Window')
ylabel('Frequency [Hz]')
%%%%%%%%%%
%Plots for verification
%
%
%%%%%%%%%%%
figure(3)
subplot(4,2,1)
plot(TIME1, EEG1)
title('Signal Window 1')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,2)
plot(TIME2, EEG2)
title('Signal Window 2')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,3)
plot(TIME3, EEG3)
title('Signal Window 3')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,4)
plot(TIME4, EEG4)
title('Signal Window 4')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,5)
plot(TIME5, EEG5)
title('Signal Window 5')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,6)
plot(TIME6, EEG6)
title('Signal Window 6')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,7)
plot(TIME7, EEG7)
title('Signal Window 7')
xlabel('Time')
ylabel('Amplitude')

subplot(4,2,8)
plot(TIME7, EEG8)
title('Signal Window 8')
xlabel('Time')
ylabel('Amplitude')

% part b
figure(4)
subplot(4,2,1)
plot(freq1, fftData1) 
title('Spectrum Window 1')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,2)
plot(freq2, fftData2) 
title('Spectrum Window 2')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')


subplot(4,2,3)
plot(freq3, fftData3) 
title('Spectrum Window 3')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,4)
plot(freq4, fftData4) 
title('Spectrum Window 4')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,5)
plot(freq5, fftData5) 
title('Spectrum Window 5')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,6)
plot(freq6, fftData6) 
title('Spectrum Window 6')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,7)
plot(freq7, fftData7) 
title('Spectrum Window 7')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

subplot(4,2,8)
plot(freq7, fftData8) 
title('Spectrum Window 8')
xlabel('Frequency (f) [Hz]')
ylabel('|Amplitude|')

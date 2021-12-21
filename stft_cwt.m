close all
clc
data_n=load('sr.txt'); % Load data
fs = 15;
ts = 1/fs;
%STFT of Original Signal without Subtracting mean 

tn1 = data_n(:,1);
sn1 = data_n(:,2);

tn2 = tn1(1):ts:tn1(end);
sn2 = interp1(tn1, sn1, tn2);

figure(1)
stft(sn2,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
[P_n,f,tn3]=stft(sn2,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
P_n_abs = abs(P_n)./length(sn2); 

[max_amp_n,idx_n] = max(P_n_abs, [], 1);
corresponding_frequency = f(idx_n);

figure(2)
plot(max_amp_n);
title("Max Amplitude of all windows in STFT");
xlabel("Window Number");
ylabel("Maximum amplitude");

figure(3)
stem(abs(f(idx_n))); 
title("Corresponding Frequency of the Max Amplitude in STFT");
xlabel("Window Number");
ylabel("Corresponding Frequency");

%STFT of Signal after Subtracting mean

data=data_n-mean(data_n);

tn3 = data(:,1);
sn3 = data(:,2);

tn4 = tn3(1):ts:tn3(end);
sn4 = interp1(tn3, sn3, tn4);

figure(4)
stft(sn4,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
[P,f,tn3]=stft(sn4,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
P_abs = abs(P)./length(sn4); 

[max_amp,idx] = max(P_abs, [], 1);
corresponding_frequency = f(idx);

figure(5)
plot(max_amp);
title("Maximum Windows Amplitude in STFT Subtracting Mean");
xlabel("Window Number");
ylabel("Maximum Amplitude");

figure(6)
stem(abs(f(idx))); 
title("Corresponding Frequency of Maximum Window Amplitude in STFT Subtracting Mean");
xlabel("Window Number");
ylabel("Corresponding Frequency");

%CWT of Signal after Subtracting Mean
figure (7)
[wt,f_wt] = cwt(sn4,fs);
plot(wt)
wt_abs = abs(wt)./length(sn4); 
[max_amp_wt,idx2] = max(wt_abs,[], 1);
corresponding_frequency_wt = f_wt(idx2);

figure(8)
plot(max_amp_wt);
title("Max Window Amplitude in Wavelet Transform");
xlabel("Window Number");
ylabel("Maximum Amplitude");

figure(9)
stem(abs(f_wt(idx2))); 
title("Corresponding Frequency of the Maximum Amplitude in Wavelet Transform");
xlabel("Window Number");
ylabel("Corresponding Frequency");


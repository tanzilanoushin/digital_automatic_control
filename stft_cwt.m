close all
clc
data_n=load('sr.txt'); % Load data in Matlab
fs = 15;
ts = 1/fs;
%STFT of Original Signal without Subtracting mean 

t_n = data_n(:,1);
s_n = data_n(:,2);

tI_n = t_n(1):ts:t_n(end);
sI_n = interp1(t_n, s_n, tI_n);

figure(1)
stft(sI_n,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
[P_n,f,t]=stft(sI_n,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
P_n_abs = abs(P_n)./length(sI_n); 

[max_amp_n,idx_n] = max(P_n_abs, [], 1);
corresponding_frequency = f(idx_n);

figure(2)
plot(max_amp_n);
title("Max amp. of all windows in STFT in. Mean");
xlabel("Window Number");
ylabel("Maximum amplitude");

figure(3)
stem(abs(f(idx_n))); 
title("Corr. freq. of the max.amp.in STFT in. Mean");
xlabel("Window Number");
ylabel("Corresponding Frequency");

%STFT of Signal after Subtracting mean:

data=data_n-mean(data_n);

t = data(:,1);
s = data(:,2);

tI = t(1):ts:t(end);
sI = interp1(t, s, tI);

figure(4)
stft(sI,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
[P,f,t]=stft(sI,fs,'Window',kaiser(4*fs,5),'OverlapLength',3*fs);
P_abs = abs(P)./length(sI); 

[max_amp,idx] = max(P_abs, [], 1);
corresponding_frequency = f(idx);

figure(5)
plot(max_amp);
title("Max. amp. of all windows in STFT ex. Mean");
xlabel("Window Number");
ylabel("Maximum amplitude");

figure(6)
stem(abs(f(idx))); 
title("Corr. freq. of the max amp. of all windows in STFT ex. Mean");
xlabel("Window Number");
ylabel("Corresponding Frequency");

%CWT of Signal after Subtracting mean:
figure (7)
[wt,f_wt] = cwt(sI,fs);
plot(wt)
wt_abs = abs(wt)./length(sI); 
[max_amp_wt,idx2] = max(wt_abs,[], 1);
corresponding_frequency_wt = f_wt(idx2);

figure(8)
plot(max_amp_wt);
title("Max amp. of all windows in Wavelet Transform");
xlabel("Window Number");
ylabel("Maximum amplitude");

figure(9)
stem(abs(f_wt(idx2))); 
title("Corr. freq. of the max amp. in Wavelet Transform");
xlabel("Window Number");
ylabel("Corresponding Frequency");


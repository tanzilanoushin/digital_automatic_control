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
%% Intrinsic Mode Function Making
imf = emd(signal,'Display',1);
%% Gamma
[Ghs,Gf,t] = hht(imf,fs,'FrequencyLimits',[35 64]);
Ghs_abs = abs(Ghs)./length(signal);
[max_amp_ng,idx_ng] = max(Ghs_abs, [], 1);
corresponding_frequency = Gf(idx_ng);
figure(1)
subplot(211)
plot(max_amp_ng);
title("Gamma");
ylabel("Gamma Maximum amplitude");
grid on
subplot(212)
stem(abs(Gf(idx_ng))); 
title("Gamma Corr. freq. of the max.amp.in HHT");
ylabel("Corresponding Frequency");
grid on
%% Beta
[Bhs,Bf,t] = hht(imf,fs,'FrequencyLimits',[12 35]);
Bhs_abs = abs(Bhs)./length(signal);
[max_amp_n,idx_n] = max(Bhs_abs, [], 1);
corresponding_frequency = Bf(idx_n);
figure(2)
subplot(211)
plot(max_amp_n);
title("Beta");
ylabel("Beta Maximum amplitude");
subplot(212)
stem(abs(Bf(idx_n))); 
title("Beta Corr. freq. of the max.amp.in HHT");
ylabel("Corresponding Frequency");
%% Alpha
[Ahs,Af,t] = hht(imf,fs,'FrequencyLimits',[8 12]);
Ahs_abs = abs(Ahs)./length(signal);
[max_amp_na,idx_na] = max(Ahs_abs, [], 1);
corresponding_frequency = Af(idx_na);
figure(3)
subplot(211)
plot(max_amp_na);
title("Alpha");
ylabel("Alpha Maximum amplitude");
subplot(212)
stem(abs(Af(idx_na))); 
title("Alpha Corr. freq. of the max.amp.in HHT");
ylabel("Corresponding Frequency");

%% Theta
[Ths,Tf,t] = hht(imf,fs,'FrequencyLimits',[4 8]);
Ths_abs = abs(Ths)./length(signal);
[max_amp_nt,idx_nt] = max(Ths_abs, [], 1);
corresponding_frequency = Tf(idx_nt);
figure(4)
subplot(211)
plot(max_amp_nt);
title("Theta");
ylabel("Theta Maximum amplitude");
subplot(212)
stem(abs(Tf(idx_nt))); 
title("Theta Corr. freq. of the max.amp.in HHT");
ylabel("Corresponding Frequency");
%% Delta
[Dhs,Df,t] = hht(imf,fs,'FrequencyLimits',[0.5 4]);
Dhs_abs = abs(Dhs)./length(signal);
[max_amp_nd,idx_nd] = max(Dhs_abs, [], 1);
corresponding_frequency = Df(idx_nd);
figure(5)
subplot(211)
plot(max_amp_nd);
title("Delta");
ylabel("Delta Maximum amplitude");
subplot(212)
stem(abs(Df(idx_nd))); 
title("Delta Corr. freq. of the max.amp.in HHT");
ylabel("Corresponding Frequency");
%%
figure(6)
hht(imf,fs)
figure()
hht(imf,fs,'FrequencyLimits',[12 35])


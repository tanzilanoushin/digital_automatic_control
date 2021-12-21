clear all
close all
clc
Window_Number=[1 2 3 4 5 6 7 8];
Max_Amplitude =[10.8544 18.3591 39.6866 18.2376 19.6998 12.5882 9.6024 7.0833];
Frequency = [2.6 2.8 3 2 2.8 2.4 2.6 24.4];
subplot(2, 1, 1)
stem(Window_Number, Max_Amplitude)
title('Maximum Amplitude Vs Window Number')
subplot(2, 1, 2)
stem(Window_Number, Frequency)
title('Frequency Vs Window Number')
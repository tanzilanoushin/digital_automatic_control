clear all
close all
clc
Window_Number=[1 2 3 4 5 6 7 8];
Max_Amplitude = [2.6 2.8 3 2.45 2.8 2.4 2.6 17.5];
Frequency =[10.9 18.3 39.6 16.17 19.69 12.58 9.61 7.2];
subplot(2, 1, 1)
stem(Window_Number, Max_Amplitude)
title('Maximum Amplitude Vs Window Number')
subplot(2, 1, 2)
stem(Window_Number, Frequency)
title('Frequency Vs Window Number')
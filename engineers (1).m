clear all;
close all;
clc;

 F1 = load("first_trial1-1.txt");
 F2 = load("first_trial2-1.txt");
 S1 = load("second_trial1-1.txt");
 S2 = load("second_trial2.txt");
% 
 F1 = F1(1:8000);
 F2 = F2(1:8000);
 S1 = S1(1:8000);
 S2 = S2(1:8000);
 
% 

% 
 HF1 = hilbert(F1);
 PhF1 = angle(HF1);
 HF2 = hilbert(F2);
 PhF2 = angle(HF2);
 uPhF1 = unwrap(PhF1);
 uPhF2 = unwrap(PhF2);
% 
 HS1 = hilbert(S1);
 PhS1 = angle(HS1);
 HS2 = hilbert(S2);
 PhS2 = angle(HS2);
 uPhS1 = unwrap(PhS1);
 uPhS2 = unwrap(PhS2);
% 
 figure
 subplot(2,1,1);
 plot(uPhF1-uPhF2); 
 subplot(2,1,2);
 plot(uPhS1-uPhS2); 
% 
 figure
 hold on;
 plot(PhF1(1:100),'b');
 plot(PhF2(1:100), 'g');
 hold off;
% 
 rHF1 = real(HF1);
 figure
 hold on
 %plot(F1(1:100))
 plot(PhS1(1:100), 'r');
 plot(PhS2(1:100), 'k');
 hold off
















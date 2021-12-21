clear all;
close all;
clc;

 F1 = load("n1.txt");
 F2 = load("n2.txt");
 S1 = load("p1.txt");
 S2 = load("p2.txt");

 Fs= 1;
 
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
 dp1 = uPhF1-uPhF2;
 dp2 = uPhS1-uPhS2;
% 
 figure (1)
 
 subplot(2,1,1);
 plot(dp1); 
 subplot(2,1,2);
 plot(dp2); 
%
 [wcoh, wcs, f] = wcoherence(F1, F2, Fs);

    max_wcoh=max(wcoh);
    figure (2)  
    plot(max_wcoh)
 












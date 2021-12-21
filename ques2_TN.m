clear all;
close all;
clc;

 N1 = load("n1.txt");
 N2 = load("n2.txt");
 P1 = load("p1.txt");
 P2 = load("p2.txt");

 Fs= 1;
 
%%%%%%%%%%%%%%%%%%%%
 HN1 = hilbert(N1);
 PhN1 = angle(HN1);
 HN2 = hilbert(N2);
 PhN2 = angle(HN2);
 uPhN1 = unwrap(PhN1);
 uPhN2 = unwrap(PhN2);
%%%%%%%%%%%%%%%%%%%%%
 HP1 = hilbert(P1);
 PhP1 = angle(HP1);
 HP2 = hilbert(P2);
 PhP2 = angle(HP2);
 uPhP1 = unwrap(PhP1);
 uPhP2 = unwrap(PhP2);
 diffN1N2 = uPhN1-uPhN2;
 diffP1P2 = uPhP1-uPhP2;
%%%%%%%%%%%%%%%%%%%%% 
 figure (1)
 subplot(2,1,1);
 plot(diffN1N2); 
 subplot(2,1,2);
 plot(diffP1P2);
%%%%%%%%%%%%%%%%%%%%%
 [wcoh, wcs, f] = wcoherence(N1, N2, Fs);

    max_wcoh=max(wcoh);
    figure (2)  
    plot(max_wcoh)
 












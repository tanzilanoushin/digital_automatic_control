clear all;
close all;
clc;

 F1 = load("n1.txt");
 F2 = load("p1.txt");
 S1 = load("n2.txt");
 S2 = load("p2.txt");
  fs = 1;
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
title('Phase diff between n1 and p1');
 subplot(2,1,2);
 plot(uPhS1-uPhS2); 
title('Phase diff between n2 and p2');
%
figure
 subplot(2,1,1);
 plot(uPhF1-uPhS1); 
title('Phase diff between n1 and n2');
 subplot(2,1,2);
 plot(uPhF2-uPhS2); 
title('Phase diff between p1 and p2');
% 
 figure
 hold on;
 plot(PhF1(1:100),'b');
 plot(PhF2(1:100), 'g');
title('Phase between n1 and p1');
 hold off;
% 
 rHF1 = real(HF1);
 figure
 hold on
 %plot(F1(1:100))
 plot(PhS1(1:100), 'r');
 plot(PhS2(1:100), 'k');
title('Phase between n2 and p2');
 hold off
%
rHF1 = real(HF1);
 figure
 hold on
 %plot(F1(1:100))
 plot(PhF1(1:100), 'r');
 plot(PhS1(1:100), 'k');
title('Phase between n1 and n2');
 hold off
%
 figure
 hold on
 %plot(F1(1:100))
 plot(PhF2(1:100), 'r');
 plot(PhS2(1:100), 'k');
title('Phase between p1 and p2');
 hold off
%
[wcoh, wcs, f] = wcoherence(S2, F2, fs);
max_wcoh_t = max(wcoh);
figure();
hold on;
plot(max_wcoh_t);
xlabel("Time (s)");
ylabel("Coherence");
title("Time Maximum Coherence");
grid on;
hold off;
figure()
plot(abs(wcoh));
xlabel("Time (s)");
ylabel("Coherence");
title("Time  Coherence");













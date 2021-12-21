clear all;
close all;
clc;

 unlock1 = load("n1.txt");
 phaselock1 = load("p1.txt");
 unlock2 = load("n2.txt");
 phaselock2 = load("p2.txt");
 fs = 1;%sampling frequency
 unlock1 = unlock1(1:8000);
 phaselock1 = phaselock1(1:8000);
 unlock2 = unlock2(1:8000);
 phaselock2 = phaselock2(1:8000);
% Hilbert Transform
 Hilunlock1 = hilbert(unlock1);
 Phaseunlock1 = angle(Hilunlock1);
 Hilphaselock1 = hilbert(phaselock1);
 Phasephaselock1 = angle(Hilphaselock1);
 unPhunlock1 = unwrap(Phaseunlock1);
 unPhphaselock2 = unwrap(Phasephaselock1);
% 
 Hunlock2 = hilbert(unlock2);
 Phaseunlock2 = angle(Hunlock2);
 Hilphaselock2 = hilbert(phaselock2);
 Phasephaselock2 = angle(Hilphaselock2);
 unPhunlock2 = unwrap(Phaseunlock2);
 unphaselock2 = unwrap(Phasephaselock2);
% 
 figure
 subplot(2,1,1);
 plot(unPhunlock1-unPhphaselock2); 
title('Phase difference between n1 and p1');
 subplot(2,1,2);
 plot(unPhunlock2-unphaselock2); 
title('Phase differenc between n2 and p2');
% 
 figure
 hold on;
 plot(Phaseunlock1(1:100),'r');
 plot(Phasephaselock1(1:100), 'b');
title('Phase difference between n1 and p1');
 hold off;
% 
 rHunlock1 = real(Hilunlock1);
 figure
 hold on
 %plot(F1(1:100))
 plot(Phaseunlock2(1:100), 'b');
 plot(Phasephaselock2(1:100), 'k');
title('Phase difference between n2 and p2');
 hold off
%
[wcoh, wcs, f] = wcoherence(phaselock2, phaselock1, fs);
max_wcoh_t = max(wcoh);
figure();
hold on;
plot(max_wcoh_t);
xlabel("Time (s)");
ylabel("Coherence");
title("Maximum Coherence Vs. Time");
grid on;
hold off;
figure()
plot(abs(wcoh));
xlabel("Time (s)");
ylabel("Coherence");
title("Time  Coherence");













clc
X=load('testEEG.txt');
fs=128;
for i=1:8
  A=X((i-1)*640+1:i*640,1:1);
  i+1;
  A;
 
[P,f]=myfft(A,fs);
 
plot(f,P);
xlabel('Frequecny');
ylabel('Amplitude');
hold on 
[Amplitude,idx] = max(P) 
Frequency = f(idx)
max(f);
max(P);
end

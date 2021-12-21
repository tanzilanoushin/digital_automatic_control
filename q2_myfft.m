clc
X=load('testEEG.txt');
for i=1:8
  A=X((i-1)*640+1:i*640,1:1);
  i+1;
  A;
 
[P,f]=myfft1(A,Fs);
 
plot(f,P);
[maxvaly,idx] = max(P) 
maxvalx = f(idx)
max(f);
max(P);
end

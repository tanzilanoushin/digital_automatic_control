X=load('sr.txt');
% Separate the columns into two arrays.
time = X(:,1);
signal = X(:,2);
fs= 3700;
[y,ty] = resample(signal,time,fs,3,1);
plot(time,signal,'o',ty,y,'.-')

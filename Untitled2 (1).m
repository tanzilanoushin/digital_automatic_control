clc;
clear all;
close all;
x=[0.00001;20;40;60;80;100;120;140;180;200;220];
y=[11.32333;11.33667;11.35;11.35667;11.38667;11.41667;11.45667;11.46;11.50667;11.56667;11.60333];
%w =[1;1;1;1;1;1];
w =[1;1;1;1;1;1;1;1;1;3;6];
plot(x,y,'.');
ft = fittype('power2');
[cf,g] = fit(x,y,ft,'Weight',w);
hold on
plot(cf,'fit');
cf 
g
%[f,g] = fit(x,y,'power2')
%plot(f,x,y)
hold on
sd_vct = [0.008819 0.006667 0.005774 0.013333 0.0120019 0.017638 0.016667 0.015275 0.012019 0.008819 0.01219];
e = errorbar(x,y,sd_vct,'.');
e.Marker = '.';
e.MarkerSize = 10;
e.Color = 'black';
e.CapSize = 4;
xlabel('Strain%')
ylabel('Resistance(k ohm)')


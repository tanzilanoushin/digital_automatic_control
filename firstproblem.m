clc;
clear all;
close all;
x=[0.00000000001;1;5;10;50;100;500;1000;5000];
y=[-0.02889;0.455;0.471667;1.186667;5.278333;9.65333;12.26667;13.82833;14.84833];
w  =[1;1;1;1;50;50;50;50;50];
plot(x,y,'.');
F = fittype('power2');
[conc,SR] = fit(x,y,F,'Weight',w);
hold on 
F
conc
SR
plot(conc,'fit');
hold on
sd_vct = [0.8722975 0.536833 0.769868 0.548112 0.400321 0.520064 0.67429 0.573844 0.708447];
e = errorbar(x,y,sd_vct,'.');
e.Marker = '.';
e.MarkerSize = 10;
e.Color = 'green';
e.CapSize = 4;
title('Sensor Response vs. Concentration')

clearvars;
close all;
clc;

%: Read the excel file using readtable function
rawTable = readtable('Data.xlsx','Sheet1');
x = rawTable.Time; %: get the excel column, Header1 (header name)
y = rawTable.Current; %: get the excel column, Header2 (header name)
figure;
plot(x,y);
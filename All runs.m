clc
clear all
close all;
BAU= xlsread('BAU.csv'); 
Trees= xlsread('Trees.xlsx');
ren= xlsread('renewables.csv');
zeroC=xlsread('Phase out coal.csv');
dy_tax=xlsread('Dynamic tax.csv');
C15= xlsread('15 euros.csv'); 
C50= xlsread('50 euros.csv'); 
C100= xlsread('100 euros.csv');
years= [2015:2050]; % timescale
%EMISSIONS

emit=[BAU(755, 2:37);BAU(755, 2:37)+Trees(937, 2:37); ren(755,2:37); zeroC(755,2:37); dy_tax(755,2:37); C15(755,2:37); C50(755,2:37); C100(755,2:37);]/1000;

labels = {'BAU','Trees','Renewables','Zero coal by 2025', 'Dynamic CT', 'Static CT15', 'Static CT50', 'Static CT100'}; %labels for legend
figure; plot(years,emit,'linewidth',2); 
grid on; xlabel('years'); ylabel('Emissions (Million tons CO2))'); legend(labels);


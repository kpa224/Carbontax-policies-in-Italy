clc
clear all
close all;
M= xlsread('SelResults.csv'); M(isnan(M)) = 0;
BAU= xlsread('BAU.csv'); BAU(isnan(BAU)) = 0;
cost= M(1,2);
BAU(755, 2:6)= M(755, 2:6);
years= [2015:2050]; % timescale
prod= M(223:246,3:38); %total production...
elec_g=prod([1,3,2,4,5,6,7,15,8],:); %total electricity production and imports
per=elec_g./sum(elec_g)*100; %percentage of each technology
%cum=cumsum(per);
labels = {'Coal','Oil','Natural Gas','Hydro', 'Storage', 'Solar', 'Wind','Electricity Import', 'Biomass'}; %labels for legend
figure; plot(years,per,'linewidth',2); 
grid on; xlabel('years'); ylabel('% by individual technology'); legend(labels);
figure; bar(years,per','stacked'); legend(labels); axis([2015 2050 0 100]);
xlabel('Years'); ylabel('% of individual technology');
%figure; plot(years,cum,'linewidth',3); 
%grid on; xlabel('years'); ylabel('commulative % by individual technology'); title('% annual production by individual technology'); legend(labels); axis([2015 2050 0 100]);
%pieplot 2050
explode=[1 1 1 0 0 0 0 0 0];
figure; pie(per(:,end),explode); legend(labels);

%emission
emit= [M(755, 2:37); BAU(755,2:37)]/1000;
figure; plot(years,emit,'linewidth',2); 
grid on; xlabel('years'); ylabel('Emissions (Million tons CO2))'); legend('Dynamic carbon taxation','BAU');
%renewables
per_re=[elec_g(1:3,:);sum(elec_g(4:8,:)); elec_g(9,:)]./sum(elec_g)*100; %percentage of renewableseach technology
figure; plot(years,per_re,'linewidth',2); 
grid on; xlabel('years'); ylabel('% by individual technology'); legend('Coal','Oil','Natural Gas','Renewables','Electricity Import');

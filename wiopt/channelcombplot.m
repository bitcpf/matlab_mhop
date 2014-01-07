% Channel comb plot
% 2.4+5.8,2.4+900,2.4+450,5.8+900,5.8+450,450+900
close all
cca=[3.09,8.1321,8.2168,7.8412,8.3416,7.3428];
gsp=[11.5934,15.0802,9.2521,14.4036,15.8455,6.5567];
pen=[22.2179,24.9855,28.4069,25.8345,30.9351,18.1946];
bfsca=[8.9460,7.9785,7.9206,13.8290,13.5729,6.2115];

comb=[cca;bfsca;gsp;pen]

bar(comb')

t=1:6
set(gca,'XTick',t)
str={'2G+5G','2G+900M','2G+450M','5G+900M','5G+450M','900M+450M'}
set(gca,'XTickLabel',str,'fontname','symbol')

title('2 Channel Combination Max Throughput')
ylabel('Max Throughput Mb/s')
legend('CCA','BFS-CA','GSP','BPS')
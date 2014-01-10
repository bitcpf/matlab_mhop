pen=[8.5029,    30.9351,    34.5374,    35.2209]
gsp=[11.0601,   15.8455,   18.7859,   19.7360];
bfsca=[9.2423,  13.8290,  14.9167,  17.9729];
cca=[3.0002,    8.3416,     11.9788,     14.4480];


figure
 set(gcf,'Visible','off');


hold on
a=1:4
plot(pen,'k*-','markers',10)
plot(gsp,'+-','markers',10)
plot(bfsca,'ro-','markers',10)
plot(a,cca)





%title('Max Network Throughput over Channels')
legend('BPS(Alg. 2)','GST(Alg. 1)','BFS-CA[24]','CCA[23]','Location','NorthWest')
xlabel('Best Performance fro Number of Bands Combined')
set(gca,'XTick',[1:1:4])


% t=1:4
% set(gca,'XTick',t)
% str={'1 Band','2 Bands','3 Bands','4 Bands'}
% set(gca,'XTickLabel',str,'fontname','symbol')

set(gca,'FontSize',16)
set(get(gca,'Children'),'linewidth',2);
figure_FontSize=16;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',16),'FontSize',figure_FontSize);
%set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]);


h = ylabel('Throughput Achieved Through Gateways (Mbps)'); % Create label 
pos = get(h,'pos'); % Read position [x y z] 
set(h,'pos',pos-[.091 0 0]) % Move label to right 

saveas(gca, 'varyradios.eps','epsc');


figure 
hold on

x = [5, 10, 14,	18,	23,	27,	31,	34,	37,	40,	43,	47,	49,	52,	54,	58,	59,	62,	65,	69,	71,	74,	77,	80]
line(x,webemulationdata2(1,:),'linestyle','-','marker','d','markerfacecolor','k','color','k','LineWidth',1.75)
line(x,webemulationdata2(2,:),'linestyle','--','marker','s','markerfacecolor','b','color','b','LineWidth',1.75)
line(x,webemulationdata2(3,:),'linestyle','-.','marker','^','markerfacecolor','g','color','g','LineWidth',1.75)
line(x,webemulationdata2(4,:),'linestyle',':','marker','v','markerfacecolor','r','color','r','LineWidth',1.75)


set(gca, 'FontSize', 16)
set(gca,'xtick',[10:10:80])
axis([0 80 0 2800])
legend('1st Hop Node','2nd Hop Node','3rd Hop Node', '4th Hop Node','Location','Northwest')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Users Per Hop')
ylabel('Download Throughput (kbps)')
colormap(copper)

print -depsc webemulation2
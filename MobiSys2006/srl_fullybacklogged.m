
figure 
hold on

x = [5,10,15,20,25,30,35,40,45,50]
line(x,webemulationdata(1,:),'marker','d','markerfacecolor','k','color','k','LineWidth',1.75)
line(x,webemulationdata(2,:),'marker','s','markerfacecolor','b','color','b','LineWidth',1.75)
line(x,webemulationdata(3,:),'marker','^','markerfacecolor','g','color','g','LineWidth',1.75)
line(x,webemulationdata(4,:),'marker','v','markerfacecolor','r','color','r','LineWidth',1.75)


set(gca, 'FontSize', 16)
set(gca,'xtick',[5 10 15 20 25 30 35 40 45 50])
axis([0 55 0 1500])
legend('1st Hop Node','2nd Hop Node','3rd Hop Node', '4th Hop Node','Location','Northwest')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Users Per Hop')
ylabel('Download Throughput (kbps)')
colormap(copper)

print -depsc webemulation
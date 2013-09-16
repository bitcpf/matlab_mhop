figure 
hold on

x = [5, 10, 14,	18,	23,	27,	31,	34,	37,	40,	43,	47,	49,	52,	54,	58,	59,	62,	65,	69,	71,	74,	77,	80]
y=.0286*5*4*x/(7)
y1=.0286*5*4*x/(7*2)
line(x,y,'color','k','LineWidth',1.75)
line(x,y1,'color','b','LineWidth',1.75)


set(gca, 'FontSize', 16)
set(gca,'xtick',[10:10:80])
%axis([0 80])
legend('Channel Activity Factor','Download Activity Factor','Location','Northwest')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Users Per Hop')
ylabel('Activity Factor')
colormap(copper)

print -depsc activity_factor

figure 
hold on

x = [1000:-100:500,450:-50:100]
line(x,srl_fullybackloggeddata(1,:),'linestyle','-','marker','d','markerfacecolor','k','color','k','LineWidth',1.75)
line(x,srl_fullybackloggeddata(2,:),'linestyle','--','marker','s','markerfacecolor','b','color','b','LineWidth',1.75)
line(x,srl_fullybackloggeddata(3,:),'linestyle','-.','marker','^','markerfacecolor','g','color','g','LineWidth',1.75)
line(x,srl_fullybackloggeddata(4,:),'linestyle',':','marker','v','markerfacecolor','r','color','r','LineWidth',1.75)


set(gca, 'FontSize', 16)
set(gca,'xtick',[100:100:1000])
axis([100 1000 0 1000])
legend('1st Hop Node','2nd Hop Node','3rd Hop Node', '4th Hop Node','Location','Northwest')
%'Single Flow, RTS/CTS Off', 
xlabel('Static Rate Limit (kbps)')
ylabel('Upload Throughput (kbps)')
colormap(copper)

print -depsc srl_fb_up
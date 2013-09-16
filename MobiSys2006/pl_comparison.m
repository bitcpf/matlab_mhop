
figure 
hold on

plcomparedata = [mean(pl_tcprtsoffupdata(1:4,:)')'/mean(singletcpdata(1,:)), mean(pl_tcprtsonupdata(1:4,:)')'/mean(singletcpdata(1,:)),mean(pl_tcprtsoffdata(1:4,:)')'/mean(singletcpdata(5,:)),mean(pl_tcprtsondata(1:4,:)')'/mean(singletcpdata(5,:))]
x = [1,2,3,4]
line(x,plcomparedata(:,1),'marker','d','markerfacecolor','k','color','k','LineWidth',1.75)
line(x,plcomparedata(:,2),'marker','s','markerfacecolor','b','color','b','LineWidth',1.75)
line(x,plcomparedata(:,3),'marker','^','markerfacecolor','g','color','g','LineWidth',1.75)
line(x,plcomparedata(:,4),'marker','v','markerfacecolor','r','color','r','LineWidth',1.75)


set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([0.5 4.5 0 .72])
legend('Upload, RTS/CTS Off','Upload, RTS/CTS On','Download, RTS/CTS Off', 'Download, RTS/CTS On','Location','Northeast')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Hops from Gateway Node')
ylabel('Normalized Throughput (Percent)')

print -depsc pl_comparison
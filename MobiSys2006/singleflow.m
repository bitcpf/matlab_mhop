%Single Active Comparison

singleflowdowndata = [mean(linkdata(5:8,:)')', mean(singleudpoffdata(5:8,:)')', mean(singletcpdata(5:8,:)')']
singleflowupdata = [mean(linkdata(1:4,:)')', mean(singleudpoffdata(1:4,:)')', mean(singletcpdata(1:4,:)')']
%min_bidirectionaldata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
%max_bidirectionaldata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on

x=[1 2 3 4]
normalizeddata = [singleflowdowndata(:,2)/singleflowdowndata(1,2), singleflowdowndata(:,3)/singleflowdowndata(1,3),singleflowupdata(:,2)/singleflowupdata(1,2), singleflowupdata(:,3)/singleflowupdata(1,3)]
%bar(max_bidirectionaldata)
line(x,normalizeddata(:,1),'marker','d','markerfacecolor','k','color','k','LineWidth',1.75)
line(x,normalizeddata(:,2),'marker','s','markerfacecolor','b','color','b','LineWidth',1.75)
line(x,normalizeddata(:,3),'marker','^','markerfacecolor','g','color','g','LineWidth',1.75)
line(x,normalizeddata(:,4),'marker','v','markerfacecolor','r','color','r','LineWidth',1.75)

%bar(min_bidirectionaldata)

set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([.5 4.5 0 1.1])
legend('UDP Download',  'TCP Download','UDP Upload',  'TCP Upload')
xlabel('Number of Hops from Gateway Node')
ylabel('Normalized Throughput (Percent)')

print -depsc singleflow
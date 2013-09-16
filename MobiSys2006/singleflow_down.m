%Single Active Comparison

singleflowdowndata = [mean(linkdata(5:8,:)')', mean(singleudpoffdata(5:8,:)')', mean(singletcpdata(5:8,:)')']
%min_bidirectionaldata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
%max_bidirectionaldata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on

normalizeddowndata = [singleflowdowndata(:,2)/singleflowdowndata(1,2), singleflowdowndata(:,3)/singleflowdowndata(1,3)]
%bar(max_bidirectionaldata)
bar(normalizeddowndata)
%bar(min_bidirectionaldata)

set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([.5 4.5 0 1.1])
legend('UDP RTS/CTS Off',  'TCP RTS/CTS Off')
xlabel('Number of Hops from Gateway Node')
ylabel('Normalized Throughput (Percent)')
colormap(copper)

print -depsc singleflow_down
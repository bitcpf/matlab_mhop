meanlinkdata = [mean(linkdata(1:4,:)')', mean(linkdata(5:8,:)')']
%mean(singletcpdata(1:4,:)')', 
%min_uploaddata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
%max_uploaddata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on

%bar(max_uploaddata)
bar(meanlinkdata)
%bar(min_uploaddata)

set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([.5 4.5 0 5200])
legend('Upload','Download')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Hops')
ylabel('Throughput (kbps)')
colormap(copper)

print -depsc link


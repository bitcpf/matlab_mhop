%Upload (link, single flow, tcprtsoff)


uploaddata = [mean(pl_tcprtsoffupdata(1:4,:)')', mean(pl_tcprtsonupdata(1:4,:)')']
%mean(singletcpdata(1:4,:)')', 
%min_uploaddata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
%max_uploaddata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on

%bar(max_uploaddata)
bar(uploaddata)
%bar(min_uploaddata)

set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([.5 4.5 0 3200])
legend('Concurrent Flows, RTS/CTS Off','Concurrent Flows, RTS/CTS On')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Hops from Gateway Node')
ylabel('Upload Throughput (kbps)')
colormap(copper)

print -depsc upload_tcp
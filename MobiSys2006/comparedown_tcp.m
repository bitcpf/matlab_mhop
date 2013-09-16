%Download (link, single flow, tcprtsoff)

t2 = mean(pl_tcprtsoffdata(1:4,:)')'
t1 = mean(singletcpdata(5:8,:)')'
t3 = mean(pl_tcprtsondata(1:4,:)')'
downloaddata = [t1,t2]
percentage = t2./t1
%min_downloaddata = [min(linkdata(:,2:4)')', min(singleflowdata(:,2:4)')', min(TCPrtsoffdata(:,2:4)')']
%max_downloaddata = [max(linkdata(:,2:4)')', max(singleflowdata(:,2:4)')', max(TCPrtsoffdata(:,2:4)')']
%mean(singletcpdata(5:8,:)')', 

figure
hold on

%bar(max_downloaddata)
bar(downloaddata)
%bar(min_downloaddata)

%all_data = [max_downloaddata; downloaddata; min_downloaddata]
%bar3(all_data, 'grouped')

set(gca, 'FontSize', 16)
axis([.5 4.5 0 4100])
set(gca,'xtick',[1 2 3 4])
legend('Single Flow, RTS/CTS Off','Concurrent Flows, RTS/CTS Off')
%'Single Flow, RTS/CTS Off', 
xlabel('Number of Hops from Gateway Node')
ylabel('Download Throughput (kbps)')
colormap(copper)

print -depsc comparedown_tcp
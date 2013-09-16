
bidirectionaldata = [mean(pl_tcprtsoffdata(5:8,:)')', mean(pl_tcprtsoffdata(9:12,:)')', mean(pl_tcprtsondata(5:8,:)')', mean(pl_tcprtsondata(9:12,:)')']
%min_bidirectionaldata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
%max_bidirectionaldata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on


%bar(max_bidirectionaldata)
bar(bidirectionaldata)
%bar(min_bidirectionaldata)

set(gca, 'FontSize', 16)
set(gca,'xtick',[1 2 3 4])
axis([.5 4.5 0 1200])
legend('Upload, RTS/CTS Off', 'Download, RTS/CTS Off', 'Upload, RTS/CTS On', 'Download, RTS/CTS Off')
xlabel('Number of Hops from Gateway Node')
ylabel('Throughput (kbps)')
colormap(pink)

print -depsc bidirectional_tcp
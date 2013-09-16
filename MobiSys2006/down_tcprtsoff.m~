%Download (link, single flow, tcprtsoff)

downloaddata = [mean(linkdata(:,2:4), 2), median(singleflowdata(:,2:4), 2), median(TCPrtsoffdata(:,2:4), 2)]
min_downloaddata = [min(linkdata(:,2:4)')', min(singleflowdata(:,2:4)')', min(TCPrtsoffdata(:,2:4)')']
max_downloaddata = [max(linkdata(:,2:4)')', max(singleflowdata(:,2:4)')', max(TCPrtsoffdata(:,2:4)')']

figure
hold on

bar(max_downloaddata)
bar(downloaddata)
bar(min_downloaddata)

%all_data = [max_downloaddata; downloaddata; min_downloaddata]
%bar3(all_data, 'grouped')

set(gca, 'FontSize', 14)
axis([.5 4.5 0 6000])
legend('Link Capacity', 'Single Active Flows', 'Concurrent Active Flows')
xlabel('Number of Hops')
ylabel('Download Bandwidth (Kbps)')

print -depsc pl_download
%Upload (link, single flow, tcprtsoff)

uploaddata = [median(linkdata(:,5:7), 2), median(singleflowdata(:,5:7), 2), median(TCPrtsoffdata(:,5:7), 2)]
min_uploaddata = [min(linkdata(:,5:7)')', min(singleflowdata(:,5:7)')', min(TCPrtsoffdata(:,5:7)')']
max_uploaddata = [max(linkdata(:,5:7)')', max(singleflowdata(:,5:7)')', max(TCPrtsoffdata(:,5:7)')']

figure 
hold on

bar(max_uploaddata)
bar(uploaddata)
bar(min_uploaddata)

set(gca, 'FontSize', 14)
axis([.5 4.5 0 5000])
set(gca,'xtick',[1 2 3 4])
legend('Link Capacity', 'Single Active Flows', 'Concurrent Active Flows')
xlabel('Number of Hops')
ylabel('Upload Bandwidth (Kbps)')
colormap(hot)


print -depsc pl_upload
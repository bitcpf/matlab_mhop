% Plot different network size


penca=[20.6722   28.8570   32.4487   30.9917   36.2440   38.5286  34.7625   36.5101   42.1458];
cca=[12.7986   12.1555   13.0277   13.3417   15.3459   13.7339   12.2438 12.7717   10.9805];
bfsca=[15.0490   15.4397   15.3388   15.5503   15.6344   16.7049   14.4962   19.1912   19.3808];
gsp=[15.5389   18.9452   16.1845   17.0160   20.7433   17.2230   16.7450   19.9253   24.3048];

close all
figure
hold on
plot(cca)

plot(bfsca,'ro-')
plot(gsp,'+-')

plot(penca,'k*-')

xtk_label={'16','18','20','22','24','27','30','33','36'};
set(gca,'xticklabel',xtk_label);

title('Max Network Throughput')
legend('CCA','BFS-CA','GSP','BPS')
xlabel('Mesh Network Size')
ylabel('Max Throughput Mb/s')
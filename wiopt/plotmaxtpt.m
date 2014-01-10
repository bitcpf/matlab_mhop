close all
penca=[11.2434   22.6991   32.9882   35.2290   53.1671   52.6482   56.4156 58.4144   53.5585   53.4234];
cca=[9.6763   10.8278   12.8485      14.4480   14.3703   16.3846   13.6864 14.6072   20.5234   20.4835];
bfsca=[10.5010   13.4492   18.0324   17.9729   18.6406   23.9752   19.4957 21.3176   24.5764   26.4835];
gsp=[9.9906   15.1331   19.0725      19.7360   20.6406   25.0988   25.4957 25.8361   26.5764   26.8835];


figure
%set(gcf,'Visible','off');

hold on
plot(penca,'k*-','markers',10)


plot(gsp,'+-','markers',10)

plot(bfsca,'ro-','markers',10)



plot(cca)
set(get(gca,'Children'),'linewidth',2);
axis([1, 10, 5, 60]);
 




set(gca,'FontSize',16)
%title('Max Network Throughput')
legend('BPS(Alg. 2)','GST(Alg. 1)','BFS-CA[24]','CCA[23]','Location','NorthWest')
xlabel('Maximum Offered Load Per Mesh Node (Mbps)')
set(get(gca,'XLabel'),'FontSize',16)
ylabel('Throughput Achieved Through Gateways (Mbps)')
set(get(gca,'YLabel'),'FontSize',16)
saveas(gca, 'maxtpt.eps','epsc');

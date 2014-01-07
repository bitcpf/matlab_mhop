penca=[11.2434   22.6991   32.9882   35.2290   53.1671   52.6482   56.4156 58.4144   53.5585   53.4234];
cca=[9.6763   10.8278   12.8485   14.4480   14.3703   16.3846   13.6864 14.6072   20.5234   20.4835];
bfsca=[10.5010   13.4492   18.0324   17.9729   18.6406   23.9752   19.4957 21.3176   24.5764   26.4835];
gsp=[9.9906   15.1331   19.0725   19.7360   20.6406   25.0988   25.4957 25.8361   26.5764   26.8835];

figure
hold on
plot(cca)
plot(bfsca,'ro-')
plot(gsp,'+-')

plot(penca,'k*-')

title('Max Network Throughput')
legend('CCA','BFS-CA','GSP','BPS')
xlabel('Mesh Node Maximal Bandwidth Mb')
ylabel('Max Throughput Mb/s')
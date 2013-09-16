% Author: Pengfei Cui
% Date: Aug 7, 2013
% For simulation of a fairness algorithm for multiband multihop evaluation

   
% Function:
    % Implement Greedy Algorithm

% Process:
    



clear all
close all

% Generate 7x7 regular grid
x=1:500:500*7;
y=1:500:500*7;
[mm,m]=size(x);
[nn,n]=size(y);

for i=1:m
    for j=1:n
        Node((i-1)*n+j,1)=x(i);
        Node((i-1)*n+j,2)=y(j);
    end
end

% Single band communicate threshold & interference threshold
C_th=550;
CI_th=1000;

% Initialize the gateway and potential nodes
temp=randperm(length(Node));
out_cap=zeros(6,49);
Gateways=[];
out_cap(1,:)=greedy_cal(Node,Gateways,C_th,CI_th);
for i=1:5
    
    index=temp(1:i);
    Gateways=Node(index,:)
    
    cap_g=greedy_cal(Node,Gateways,C_th,CI_th);
    out_cap(i+1,i+1:49)=cap_g;
end

figure
hold on
plot(out_cap(1,:))
plot(out_cap(2,:),'+')

legend('Start 1 Fixed Node')
plot(out_cap(3,:),'*')
legend('Start 1 Fixed Node')
plot(out_cap(4,:),'r')
legend('Start 1 Fixed Node')
plot(out_cap(5,:),'b')
legend('Start 1 Fixed Node')
plot(out_cap(6,:),'o')

legend('Start 1 Fixed Node')
xlabel('# of Gateway Nodes')
ylabel('Capacity')
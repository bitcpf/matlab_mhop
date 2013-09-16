% Author: Pengfei Cui
% Date: Aug 2, 2013
% For simulation of a fairness algorithm for multiband multihop evaluation

   
% Function:
    % Implement the MinHop algorithm 

% Process:
    % Have regular grid
    % Need a start placement
    % Need a transship implementation for function add(s), generate
    % function add
  
    
clear all
close all

% Generate 7x7 regular grid
x=1:500:500*5;
y=1:500:500*1;
[mm,m]=size(x);
[nn,n]=size(y);

% Column 1,2 is the x-axis, y-axis, column 3 is the # of nodes 
node_cnt=1;
for i=1:m
    for j=1:n
        Node((i-1)*n+j,1)=x(i);
        Node((i-1)*n+j,2)=y(j);
        Node((i-1)*n+j,3)=node_cnt;
        node_cnt=node_cnt+1;
    end
end

% Single band communicate threshold & interference threshold
% Threshold is in distance
C_th=550;
CI_th=1000;






% Generate gateway placement
Gateway_tran_input=[];
Gateways_b_no=[2,1];
mesh_node=Node;
for i=1:length(Gateways_b_no)
    index=find(Node(:,3)==Gateways_b_no(i));
    Gateway_tran_input=[Gateway_tran_input ; Node(index,:)];
    mesh_node(index,:)=[];
end



Gateways=Gateway_tran_input(:,1:2);
temp_cap=capacity_cal(Node(:,1:2),Gateways,C_th,CI_th);



% Transship with AMPL Need to modified for the algorithm
% The output of AMPL and the frame for transship has been debugged, works
% fine

% Lambda is the percentage satifisy each mesh node
lambda=1;


% Generate the orig and dest for transship problem
%temp_orig=


% Problem is a transship problem with transfer!!!!

% Gateways are supply, mesh nodes are demands

m=length(Gateway_tran_input(:,3)); % # of Gateways nodes
n=length(mesh_node(:,3)); % # of mesh nodes 

% Multiband threshold
C_th_multiband=[C_th];
CI_th_multiband=[CI_th];% Multiband contention only related to capacity calculation

orig=1:(n*2+m);
dest=1:(n*2+m);

orig_nodes=[mesh_node(:,1:2);mesh_node(:,1:2);Gateway_tran_input(:,1:2)];
dest_nodes=[mesh_node(:,1:2);mesh_node(:,1:2);Gateway_tran_input(:,1:2)];

% Cost is the hop number which is 1, but need to deal with the
% inter-transfer problem, Generate Cost map
% Need to change the cost in the future according to the path loss
% exponenet


for k=1:length(C_th_multiband)
for i=1:length(orig)
    for j=1:length(dest)
        % 
        temp_dis=pdist([orig_nodes(i,:);dest_nodes(j,:)],'euclidean');
        if(temp_dis==0)
            temp_cost(i,j)=10e6;
        elseif(temp_dis<=C_th_multiband(k))
            % Need to adjust according to the pathloss exponent function
            % later !!!!!!!!!!!!!!!!!!!!!!
            temp_cost(i,j)=1;
        else
            temp_cost(i,j)=10e6;
        
        end
    end
end
end
cost=[orig(:) temp_cost]




% Supply is the Gateway capacity which is infinite
supply=[zeros(1,2*n) 10000*ones(1,m)]
 %demand=[(rand(1,n)+1) zeros(1,m+n)]

load demand_tst





% if sum(supply)>sum(demand)
%     demand(1)=demand(1)+sum(supply)-sum(demand);
% else
%     supply(1)=supply(1)+sum(demand)-sum(supply);
% end
%demand=demand*sum(supply)/sum(demand);
supply=[orig(:) supply(:)]
demand=[dest(:) demand(:)]



%cost=[orig(:) rand(m,n)];
dlmwrite('orig',orig,' ');
dlmwrite('dest',dest,' ');
dlmwrite('supply',supply,' ');
dlmwrite('demand',demand,' ');
dlmwrite('cost',cost,' ');
!ampl transship.mod
delete orig
delete dest
delete supply
delete demand
delete cost

!python ampl_matlab.py

load trans.txt
trans






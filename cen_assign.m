% Author: Pengfei Cui
% Date: May 22, 2013
% For simulation of a fairness algorithm for multiband multihop evaluation


close all
clear all

% Define the variable
node_amount=100;





% Temporary define the band VS distance
clique_dis=[500,550,700,850];


% 
x=unifrnd(-0.7,2.7,node_amount,1);
a=sqrt(1.7^2-abs(x-1).^2);
y=unifrnd(-a+1,a+1,node_amount,1)*1500;
x=x*1500;
grid=[x,y];
%plot(x,y,'*')


% Find the middle point of the nodes
[m,n]=size(grid);

mid_p(1,1)=median(grid(:,1));
mid_p(1,2)=median(grid(:,2));

for i=1:m
    mid_dis(i,1)=sqrt((grid(i,1)-mid_p(1,1))^2+((grid(i,2)-mid_p(1,2)))^2);
    mid_dis(i,2)=i;
    
end


% Order the nodes according to the distance from the middle node
mid_dis=sortrows(mid_dis,1);
for i=1:m
    grid_o(i,1:2)=grid(mid_dis(i,2),:);
        
    
end

grid=grid_o;

[m,n]=size(grid);

[mk,nk]=size(clique_dis);

% Get the amount of node in a clique of a band
for i=1:m

cur_node=grid(i,:);

for j=1:m
    node_dis(j)=sqrt((grid(j,1)-cur_node(1,1))^2+((grid(i,2)-cur_node(1,2)))^2);
    
end


for k=1:nk
    temp=find(node_dis<clique_dis(k));
    temp_dis=node_dis;
    % Record the as (band, cur_node)
    temp_dis(temp)=10^10;
    temp_dis=temp_dis-node_dis;
    
    temp_index=find(temp_dis>0);
    temp_dis(temp_index)=1;
    clique_bool(k,i,:)=temp_dis;
end


end

% Assign band for each channel
clique_assign=clique_bool;
clique_a_next=clique_bool;
node_assign=zeros(nk,m);



for j=1:40

for i=1:m % each node
    for k=1:nk %each band
        temp_c_m(k)=sum(clique_assign(k,i,:));
    end
    index=find(temp_c_m==min(temp_c_m));% Find the band with the fewest nodes
    node_assign(index(1),i)=1/temp_c_m(index(1));% Assign part of the channel for a node  
    
    clique_a_next(:,:,i)=0; % with the next line to make sure the node is removed from other band and node clique
    clique_a_next(index(1),:,i)=1; % add the assign band to the clique matrix
    clique_assign=clique_a_next;
end

av_time(j)=sum(node_assign(:))

end

plot(av_time);

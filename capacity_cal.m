% Author: Pengfei Cui
% Date: July 29, 2013
% For simulation of a fairness algorithm for multiband multihop evaluation

% Input:
    % Nodes locations with calculated distance from the center of the map
    % Node(x,y), # in row
    % Gateway nodes loacations Gateways(x,y), #in row
    % Communication distance C_th
    % Click distance CI_th
    
% Function:
    % Calculate the capacity of the network with the gatewaynodes in one
    % band. For multiband utility, calculate the 
    
  
    
% function out=distance_cal(Node,Gateways,C_th,CI_th)

clear all
close all
% Temp data
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

capacity=0;


Gateways=[1501,1001];
   % 1501,1501;
   % 2501,3501
   % ];


C_th=550;
CI_th=1000;

[m_n,n_n]=size(Node);
[m_g,n_g]=size(Gateways);

m=1;
while(m<=m_g)
    pm=0;
    cm=0;
    for i=1:m_n
        dis=sqrt((Gateways(m,1)-Node(i,1))^2+(Gateways(m,2)-Node(i,2))^2);
    
    if(dis<=C_th && dis>0)
        pm=pm+1;
       pent_node(pm,:)=Node(i,:);
    end
    if(dis<=CI_th && dis>0)
        cm=cm+1;
        cont_g_node(cm,:)=Node(i,:);
    end    


    
    
    end
    
    
    % Statis Contention for the pent_node
   
    % First loop for all potential communication nodes
    for ip=1:pm
         ct_link_contention=0;
    % Loop Check all nodes to find nodes contend with potential communication
    % nodes
    for k=1:m_n
        dis_p=sqrt((pent_node(ip,1)-Node(k,1))^2+(pent_node(ip,2)-Node(k,2))^2);
        
        % Find the node in potential node contention area
        if(dis_p<=CI_th && dis_p>0)
   
    % Take off all double count nodes
    ct_c=0;
        for kk=1:cm

            dis_gc_nc=abs(cont_g_node(kk,1)-Node(k,1))+abs(cont_g_node(kk,2)-Node(k,2));
                
            if(dis_gc_nc==0 || sum(abs(Node(k,:)-Gateways(m,:)))==0 || sum(abs(Node(k,:)-pent_node(ip,:)))==0)

                ct_c=ct_c+1;
            end
        end
        
        if(ct_c==0)
            ct_link_contention=ct_link_contention+1;
            
        end
        
        
        end
    end
    % Output gateway node to mesh link contention number
    [tempm,tempn]=size(cont_g_node);
    % Debug for out put pent_node(ip,:)
    % -1 delete the potential node itself
    
    % Output contention for a link is correct now
    out_cont_pn=ct_link_contention+tempm-1;
    
    end
    capacity=capacity+1/out_cont_pn
    m=m+1;
end






% Matlab scritp to implement the Degree method for gateway placement
% Generate regular grid
% Temporary use uniform demand of all node, could be modified later
% Use Arbitrary link capacity and no inter node interference right now,
% could be modified later according to the interference range defined

clear all
close all


% Arbitrary grid for debugging
  N_x=2;
  N_y=2;
  ga_fl=1;
% Define bands used in algorithm, high freq first
  bands=[2.4*10^9];
  
  % According to bands, we can calculate link capacity range and
  % interference range
  % Define single link capacity and threshold in the future need to define
    % inter node interference distance
    % Temporary define uniform capacity
    % High freq first
    l_cap=[6];
    d_thre=[500];
    inter_thre=[650];

  
  % Adjancy degree 
    a_degree=2;

% Could be set up to do multiple grid placement in the 2 for setting
%for N_x=1:1
%    for N_y=2:15


% Uniform Demand temporary
demandu=ones(1,N_x*N_y);


% Define input variables
demandd=demandu*2;
demandu=demandu*1.5;



% Generate grid and capacity according to distance
[X,Y]=meshgrid(1:500:500*N_x,1:500:500*N_y);

% MN_loc is the location of each mesh node (Gateway option)
f_c=1;
for i=1:N_x
    for j=1:N_y
        MN_loc(f_c,1)=X(1,i);
        MN_loc(f_c,2)=Y(j,1);
        f_c=f_c+1;
    end
end


MN=1:(N_x*N_y);


% Generate 1 hop capacity between every mesh node, R_link(node, node, band)
for b=1:length(bands)
for i=1:length(MN_loc(:,1))
    for j=1:length(MN_loc(:,1))
        dis_temp(i,j)=sqrt((MN_loc(i,1)-MN_loc(j,1))^2+(MN_loc(i,2)-MN_loc(j,2))^2);
        if(i==j)
            R_link(i,j,b)=0;
        elseif(dis_temp(i,j)<=d_thre(b))
            R_link(i,j,b)=l_cap(b);
        else
            R_link(i,j,b)=0;
        end
    end
    
end
end
% Get 1 hop Adjancy matrix, Ad_d1 is the adjancy matrix for sum of all band, Ad_multi is 3 dimension matrix have the info of each band using for building sub tree 

Ad_multi=R_link;
Ad_multi(Ad_multi>0)=1;
Ad_d1=sum(R_link,3);
Ad_d1(Ad_d1>0)=1;


% Need to get interference link matrix, R_i(i,j,k,l,b),link [i,j] is
% interferenced by link [k,l] on band b, 1 means there is interference, 0
% means no interference. Only count the inter node interference, intra node
% interference is not counted


for i=1:length(MN_loc(:,1))
    for j=1:length(MN_loc(:,1))
        for k=1:length(MN_loc(:,1))
            for l=1:length(MN_loc(:,1))
                for b=1:length(bands)
                    % Exclude intra node interference
                    if(Ad_d1(i,j)==1 && i ~=k && j~=k && i~=l && j~=l && k~=l)
                        dis_temp1=sqrt((MN_loc(i,1)-MN_loc(k,1))^2+(MN_loc(i,2)-MN_loc(k,2))^2);
                        dis_temp2=sqrt((MN_loc(j,1)-MN_loc(k,1))^2+(MN_loc(j,2)-MN_loc(k,2))^2);
                        dis_temp3=sqrt((MN_loc(i,1)-MN_loc(l,1))^2+(MN_loc(i,2)-MN_loc(l,2))^2);
                        dis_temp4=sqrt((MN_loc(j,1)-MN_loc(l,1))^2+(MN_loc(j,2)-MN_loc(l,2))^2);
                         if(dis_temp1<inter_thre(b) || dis_temp2<inter_thre(b) || dis_temp3<inter_thre(b) || dis_temp4 < inter_thre(b))
                             R_i(i,j,k,l,b)=1;
                         else
                            R_i(i,j,k,l,b)=0;
                         end
                    else
                        R_i(i,j,k,l,b)=0;
                    end
                end
            end
        end
    end
    
end





% Above are input


% rs_demand is the demand that has not been satisfied by the assignment
rs_demand_d=demandd;
rs_demand_u=demandu;
% ga variable that marks which node 
ga=zeros(1,numel(MN));


% Generate Adjacency matrix degree a_degree
[m,n]=size(Ad_d1);
Ad_nhop=Ad_d1;

for k=1:a_degree


for i=1:m
    for j=1:n
        if(Ad_d1(i,j)==1)
            Ad_nhop(i,:)=Ad_nhop(i,:)+Ad_d1(j,:);
        end        
    end
    Ad_nhop(i,i)=0;
end
 
end

Ad_nhop(Ad_nhop>0)=1;




% Following implement the IGW multiband algorithm

% Traffic assignment, get the matrix from R_link
traf_d=R_link.*0;
traf_u=R_link.*0;


% Calculate the GA capacity and set the initial value of percent a GA can
% be used to generate a sub tree
ga_cap=sum(l_cap);






while((sum(rs_demand_u)+sum(rs_demand_d))>0) % Stop when all the demand are satisfied
    
% Define initial serve rate 75%
serve_rate=0.75;

% Calculate the degree of all the nodes
igw_degree=sum(Ad_nhop);

% Need to generate a sub-tree for the network
% 1. Find the node on the boundry 
    start_x=find(MN_loc(:,1)==min(MN_loc(:,1)));
    start_point=find(MN_loc(start_x,2)==min(MN_loc(start_x,2)));
    start_point_loc=MN_loc(start_point,:);
    
    serve_node=start_point;
    temp_ga=start_point;

% 2. BFS search find the sub tree according to the capacity of a GA node 
    sub_tree_Ad_multi=Ad_multi;
    subtree_igw_degree=igw_degree;
    
    subtree_igw_degree(serve_node)=0
    
    
 for i=1:numel(bands)
    if (sum(demandd(serve_node))+sum(demandu(serve_node)-demandd(temp_ga)-demandu(temp_ga)) < serve_rate*ga_cap)
 
            % Find the 1 hop connection of start point, high freq first
            index=find(sub_tree_Ad_multi(start_point,:,i)==1)
            % Choose the node with most n hop degree, since they have more
            % connection can transfer flow to other nodes
            index_igw=find(subtree_igw_degree(index)==max(subtree_igw_degree(index)))
            next_node=index(index_igw(1))
            serve_node=[serve_node next_node]
            tempga_index=find(igw_degree(serve_node)==max(igw_degree(serve_node)))
            temp_ga=tempga_index(1)
            % Update igw_degree matrix and Ad_multi matrix
            subtree_igw_degree(next_node)=0
            sub_tree_Ad_multi(start_point,next_node,i)=0
            
            % need to think about the stop rule when all the demand are
            % served
    end
 end
            
        
    


    
% tshar is the time share between 2 node, is a nxn matrix    
tshar=zeros(numel(MN));


% Find the node with the max degree, max() will return the first 
[mavalue,gw_temp]=max(igw_degree);

% Select max value as gateway,
gw_temp=gw_temp(1);
%1.delete the demand of the selected gateway
ga(gw_temp)=1;
rs_demand_d(gw_temp)=0;
rs_demand_u(gw_temp)=0;
% 2. Assign the capacity to nearest neighbors to reduce the hop count
% 3. Shrink the Adj matrix with deleting the gateway, 



index=find(Ad_d1(gw_temp,:)>0);

[minvalue,temp]=min(igw_degree(index));
md_satisfy=index(temp);

     gw_cap1=0.*(R_link(gw_temp,:));
     gw_cap1(md_satisfy)=R_link(gw_temp,md_satisfy)*(1-tshar(gw_temp,md_satisfy))

[gw_cap,rs_demand_d,rs_demand_u,traf_d_out,traf_u_out,tshar]=traffic_interation(Ad_nhop,tshar,Ad_d1,rs_demand_d,rs_demand_u,R_link,gw_temp,igw_degree,traf_d,traf_u,index,md_satisfy,gw_cap1,temp)


% traf_d=traf_u_out;
% traf_u=traf_d_out;


if(sum(gw_cap)>0 && (sum(rs_demand_d)+sum(rs_demand_u))>0)
    
    for i=1:numel(index)
        gw_next=index(i);
        index_hop2=find(Ad_d1(gw_next,:)>0);
        
        [minvalue,temp]=min(igw_degree(index_hop2));
        md_satisfy=index_hop2(temp)

        gw_cap1=0.*(R_link(gw_next,:));
        gw_cap1(md_satisfy)=sum(gw_cap)
        
        tshar_prev=tshar;
        
        [gw_cap,rs_demand_d,rs_demand_u,traf_d,traf_u,tshar]=traffic_interation(Ad_nhop,tshar,Ad_d1,rs_demand_d,rs_demand_u,R_link,gw_next,igw_degree,traf_d,traf_u,index_hop2,md_satisfy,gw_cap1,temp)
        
        traf_d_out=traf_d_out+traf_d;
        traf_u_out=traf_u_out+traf_u;
        
        tshar_dif=tshar-tshar_prev;
        tshar(gw_temp,gw_next)=tshar(gw_temp,gw_next)+tshar(gw_next,md_satisfy)*R_link(gw_next,md_satisfy)/R_link(gw_temp,gw_next)
        
        
    end
    
end


Ad_nhop(gw_temp,:)=0;
Ad_nhop(:,gw_temp)=0;

end

ga
ga_store(ga_fl)=sum(ga);
ga_fl=ga_fl+1;

%    end
%end
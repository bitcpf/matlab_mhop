% Matlab scritp to implement the Degree method for gateway placement
% Generate regular grid
% Temporary use uniform demand of all node, could be modified later
% Use Arbitrary link capacity and no inter node interference right now,
% could be modified later according to the interference range defined

clear all
close all


% Arbitrary grid for debugging
  N_x=10;
  N_y=10;
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
demandd=demandu*0.5;
demandu=demandu*0.1;



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

d=numel(MN_loc(:,1));
R_i=zeros(d,d,d,d,numel(bands));
clear d
for i=1:length(MN_loc(:,1))
    delta_x=MN_loc(i,1)-MN_loc(:,1);
    delta_y=MN_loc(i,2)-MN_loc(:,2);
    dist=sqrt(delta_x.^2+delta_y.^2);
    for b=1:length(bands)
        Ni_interference=find(dist<=inter_thre(b));
        Ni_link=find(Ad_multi(i,:,b)==1);
        for j=1:length(Ni_interference)
            Nj_link=find(Ad_multi(Ni_interference(j),:,b)==1);
        R_i(i,Ni_link,Ni_interference(j),Nj_link,b)=1;        
        R_i(i,Ni_link,Nj_link,Ni_interference(j),b)=1;
        R_i(Ni_link,i,Ni_interference(j),Nj_link,b)=1;
        R_i(Ni_link,i,Nj_link,Ni_interference(j),b)=1;
        end
    end
end
% Delete intra node interference which could be taken by time share
for i=1:length(MN_loc(:,1))
        R_i(i,i,:,:,:)=0;
        R_i(i,:,i,:,:)=0;
        R_i(i,:,:,i,:)=0;
        R_i(:,:,i,i,:)=0;
        R_i(:,i,i,:,:)=0;
        R_i(:,i,:,i,:)=0;
   
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



% Define initial serve rate 75%
serve_rate=0.75;


%while((sum(rs_demand_u)+sum(rs_demand_d))>0) % Stop when all the demand are satisfied
    


% Calculate the degree of all the nodes
igw_degree=sum(Ad_nhop);

% Need to generate a sub-tree for the network
% 1. Find the node on the boundry 
    start_x=find(MN_loc(:,1)==min(MN_loc(:,1)));
    start_point=find(MN_loc(start_x,2)==min(MN_loc(start_x,2)));
    start_point_loc=MN_loc(start_point,:);
    
%    subtree_serve_node=start_point;
tshar=zeros(numel(MN));

% 2. BFS search find the sub tree according to the capacity of a GA node 
    % Function needed
    serve_nodes=[];%=subtree_serve_node;
    [subtree,sub_ga]=subtree_gen(a_degree,serve_rate,ga_cap,bands,start_point,demandd,demandu,serve_nodes,igw_degree,Ad_multi)

    
    % Assign GA capacity to the subtree nodes
[tst1,tst2]=subtree_assign(subtree,sub_ga,bands,serve_nodes,Ad_multi,a_degree,rs_demand_d,rs_demand_u,l_cap,tshar)

    

%function subtree=subtree_generator(a_degree,serve_rate,mesh_loc,l_cap,d_thre,inter_thre)



% Generate 1 hop capacity between every mesh node, R_link(node, node,
% band),l_cap number equals to bands number
for i=1:length(mesh_loc(:,1))
    
    delta_x=mesh_loc(i,1)-mesh_loc(:,1);
    delta_y=mesh_loc(i,2)-mesh_loc(:,2);
    dist=sqrt(delta_x.^2+delta_y.^2);
    for b=1:length(l_cap)
        index_link=find(dist<=d_thre(b));
        R_link(i,index_link,b)=l_cap(b);
    end
    R_link(i,i)=0;
    
    
end

% Get 1 hop Adjancy matrix, Ad_d1 is the adjancy matrix for sum of all band, Ad_multi is 3 dimension matrix have the info of each band using for building sub tree
Ad_multi=R_link;
Ad_multi(Ad_multi>0)=1;
Ad_d1=sum(R_link,3);
Ad_d1(Ad_d1>0)=1;
% Need to generate a sub-tree for the network

% 1. Find the boundry point
start_x=find(mesh_loc(:,1)==min(mesh_loc(:,1)));
start_point=find(mesh_loc(start_x,2)==min(mesh_loc(start_x,2)));

% BFS get a tree start from the start_point with step number from the
% startpoint to the visited node,stored as (link start, link end, steps from start point)

bfstree=bfs(Ad_d1,start_point)


% Calculate the GA capacity and set the initial value of percent a GA can
% be used to generate a sub tree
ga_cap=sum(l_cap);

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

nhop_degree=sum(Ad_nhop);

% Rank all the nodes in the subtree
for i=1:numel(mesh_loc(:,1))
    temp_hop=[];
    for j=1:max(max(bfstree(:,3)))
        [index1]=find(bfstree(:,2)==i);
    [index_hop1]=find(bfstree(index1,3)==j);
    
    % Get the hop number, self node equals to 0
    if numel(index_hop1)>0
        hop_no=j;
    else
        hop_no=0;
    end
    
    temp_hop=[temp_hop hop_no];
    end
    if sum(temp_hop)>0
        temp_hop=temp_hop(find(temp_hop>0));
    end
    

    
    % Get the freq weight with interference distance
    tmp=bfstree(index1,2);
    pre=bfstree(index1,1);
    freq_weight=0;
    for k=1:min(temp_hop)
 
        if max(Ad_multi(pre,tmp,:))>0
            fw_index=min(find(Ad_multi(pre,tmp,:)==max(Ad_multi(pre,tmp,:))));
            freq_weight=freq_weight+inter_thre(fw_index);
            
            tmp=bfstree(find(bfstree(:,2)==pre),2);
            pre=bfstree(find(bfstree(:,2)==pre),1);
        end
    end

   
    sort_hop(i,:)=[i min(temp_hop) freq_weight];
    
end

% Node_candidate node no., connection No. from Start point, freq & hop
% weight, connect degree
node_candidate=[sort_hop nhop_degree']

%=sortrows(sort_hop,2) 


        


subtree=bfstree;





% load demand_current
%clear link_matrix

link_matrix=zeros(4,(numel(ga)+numel(mesh_nodes)));
link_matrix(:,1:numel(ga))=[ga;zeros(size(ga));zeros(size(ga));zeros(size(ga))];
cnt=numel(ga);
all_nodes=[ga mesh_nodes];
link_cap=6;
mesh_demand_mul=rand(1,numel(all_nodes))*4

for dd=1:size(mesh_demand_mul,1)
mesh_demand_mul(dd,:)=mesh_demand_mul(dd,:)*dd;
end


for bfs_current=1:numel(all_nodes)
    current_node=all_nodes(bfs_current);
    
   for bfs_next=bfs_current:numel(all_nodes)
       next_node=all_nodes(bfs_next);
       for band_i=1:numel(bands)
           if(act_link(current_node,next_node,band_i)==1);
               link_matrix(1,cnt+1)=next_node;
               link_matrix(2,cnt+1)=link_matrix(2,bfs_current)+1;
               link_matrix(3,cnt+1)=current_node;
               link_matrix(4,cnt+1)=band_i;
               cnt=cnt+1;
           end
           
       end
    
    
    
   end    
end


sum_tpt=0;
sum_previous=1;
out_sum=[];
act_cap=act_link*link_cap;
routing_link=zeros(size(act_link));

for demand_amnt=1:size(mesh_demand_mul,1)
    sum_tpt=0;
    act_cap=act_link*link_cap;
    routing_link=zeros(size(act_link));
    
    
    while(sum_tpt~=sum_previous || sum(mesh_demand_mul(demand_amnt,:))-sum(mesh_demand_mul(demand_amnt,:))<0)
        sum_previous=sum_tpt
        current_demand=mesh_demand_mul(demand_amnt,:)
for tpt_i=1:max(link_matrix(2,:))+1
   lay_idx=find(link_matrix(2,:)==tpt_i-1);
   sub_matrix=link_matrix(:,lay_idx);
   
   if(tpt_i-1==0)
       sum_tpt=sum_tpt;
       
   else
       % Demand less than capacity
       lay_served=[]
       lay_unserved=sub_matrix(1,:)
       
       
       while(numel(lay_served)<numel(sub_matrix(1,:)))
           
           % Rank path in the same layer
           
    act_dtst=sum(act_link,3);
    % Generate Traffic for each mesh node randomly

%mesh_demand=6*rand(size(mesh_nodes));
act_sparse=sparse(act_dtst);

process_temp=lay_unserved

for prank_i=1:numel(ga)
    for prank_j=1:numel(process_temp(1,:))
        
        path_value=0;
        link_value=0;
        process_temp
        [Dist,Path]=graphshortestpath(act_sparse,ga(prank_i),process_temp(1,prank_j),'Method','Dijkstra');
        if numel(Path)>1
            for pi=2:numel(Path)
                current_band=find(act_link(Path(pi-1),Path(pi),:)==1);
                link_value=sum(sum(routing_link(:,:,current_band).*reshape(R_i(Path(pi-1),Path(pi),:,:,current_band),size(routing_link(:,:,current_band)))))+sum(sum(routing_link(:,:,current_band).*reshape(R_i(Path(pi),Path(pi-1),:,:,current_band),size(routing_link(:,:,current_band)))));
                path_value=link_value+path_value;
            end
            process_temp(2,prank_j)=path_value;
            process_temp(3,prank_j)=ga(prank_i);
        end
    end
end
           
           if(numel(process_temp)>0)
           process_temp=sortrows(process_temp',2)'
 
           
           current_node=process_temp(1,1);
           ga_connected=process_temp(3,1);
           [Dist,Path]=graphshortestpath(act_sparse,ga_connected,current_node,'Method','Dijkstra');
           
           % Selected the path, then update the path
           path_cap=link_cap;
           path_channel=[];
           link_cap_path=[];
           for pi=2:numel(Path)
                current_band=find(act_link(Path(pi-1),Path(pi),:)==1);
                path_channel=[path_channel current_band];
                dup_flag=find(path_channel==current_band);
                temp_cap=act_cap(Path(pi-1),Path(pi),current_band);
                link_cap_path=[link_cap_path temp_cap];
                if(numel(dup_flag)>1)
                    for dup_i=1:numel(dup_flag)
                        
                        conflic_temp=R_i(Path(dup_flag(dup_i)),Path(dup_flag(dup_i)+1),Path(dup_flag),Path(dup_flag+1),current_band)
                        conflic(dup_i)=sum(conflic_temp(:))
                    end
                    tt_cap=min(link_cap_path(dup_flag)./conflic);
                    temp_cap=min(tt_cap,temp_cap)
                    
                end
                
                
                % Update path_capacity
                if(path_cap>temp_cap)
                    path_cap=temp_cap;
                end
           
            end
           else
               path_cap=0;
           end
           
           path_cap
           
           
           
       if(path_cap>current_demand(current_node))
           % Assign current demand to total tpt
           sum_tpt=sum_tpt+current_demand(current_node)
           % Update demand info
           
           mesh_demand_mul(demand_amnt,current_node)=0
           % Update act_cap in the path
           for pi=2:numel(Path)

           act_cap(Path(pi-1),Path(pi),path_channel(pi-1))=act_cap(Path(pi-1),Path(pi),path_channel(pi-1))-current_demand(Path(pi));
           act_cap(Path(pi),Path(pi-1),path_channel(pi-1))=act_cap(Path(pi),Path(pi-1),path_channel(pi-1))-current_demand(Path(pi));
           % Update interference nodes
           tmp_idx=find(R_i(Path(pi-1),Path(pi),:,:,path_channel(pi-1))==1);
           act_temp=act_cap(:,:,path_channel(pi-1));
           act_temp(tmp_idx)=act_temp(tmp_idx)-current_demand(Path(pi));
           act_cap(:,:,path_channel(pi-1))=act_temp;
           
           tmp_idx=find(R_i(Path(pi),Path(pi-1),:,:,path_channel(pi-1))==1);
           act_temp=act_cap(:,:,path_channel(pi-1));
           act_temp(tmp_idx)=act_temp(tmp_idx)-current_demand(Path(pi));
           act_cap(:,:,path_channel(pi-1))=act_temp;
           
           tmp_idx=find(act_cap<0)
           act_cap(tmp_idx)=0;
           % Update routing link
           routing_link(Path(pi-1),Path(pi),path_channel(pi-1))=1;
           routing_link(Path(pi),Path(pi-1),path_channel(pi-1))=1;
           % Update served node
           end
           lay_served=[lay_served,current_node];
           lay_unserved(find(lay_unserved==current_node))=[];
           
       else
           
           % Assign current demand to total tpt
           sum_tpt=sum_tpt+path_cap;
           % Update demand info
           mesh_demand_mul(demand_amnt,current_node)=mesh_demand_mul(demand_amnt,current_node)-path_cap;
           % Update act_cap
           for pi=2:numel(Path)
           act_cap(Path(pi),Path(pi-1),path_channel(pi-1))=act_cap(Path(pi),Path(pi-1),path_channel(pi-1))-path_cap;
           act_cap(Path(pi-1),Path(pi),path_channel(pi-1))=act_cap(Path(pi-1),Path(pi),path_channel(pi-1))-path_cap;
           % Update interference nodes
           tmp_idx=find(R_i(Path(pi),Path(pi-1),:,:,path_channel(pi-1))==1);
           act_temp=act_cap(:,:,path_channel(pi-1))
           act_temp(tmp_idx)=act_temp(tmp_idx)-path_cap;
           act_cap(:,:,path_channel(pi-1))=act_temp;
           
           tmp_idx=find(R_i(Path(pi-1),Path(pi),:,:,path_channel(pi-1))==1);
           act_temp=act_cap(:,:,path_channel(pi-1));
           act_temp(tmp_idx)=act_temp(tmp_idx)-path_cap;
           act_cap(:,:,path_channel(pi-1))=act_temp;
           
                      
           tmp_idx=find(act_cap<0)
           act_cap(tmp_idx)=0;
           % Update routing link
           routing_link(Path(pi-1),Path(pi),path_channel(pi-1))=1;
           routing_link(Path(pi),Path(pi-1),path_channel(pi-1))=1;
           end
           % Update served node
           lay_served=[lay_served,current_node]
           lay_unserved(find(lay_unserved==current_node))=[]
           
           
           
       end
       
       
       end
       
   end
   
   
   
    
end
sum_tpt
sum_previous
    end
    
out_sum=[out_sum sum_tpt];

end

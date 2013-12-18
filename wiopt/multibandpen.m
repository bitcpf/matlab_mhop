% Implement 2nd algorithm


clear all
close all

load test

% Inilize

n_served=[];
mesh_nodes=MN;
mesh_nodes(ga)=[];
act_link=R_link*0;
back_Ad_multi=Ad_multi;
back_R_link=R_link;

weight=ones(size(R_link));

R_link(R_link>0)=1;
path_store={};

% Random the mesh nodes order
od=randperm(numel(mesh_nodes));
for i=1:numel(od)
    tmp(i)=mesh_nodes(od(i));
end


%mesh_nodes=tmp;

mesh_nodes=[18     5    28    20    16    27    12    11    13     3     4    17     7 2    26     6    21    14    30     8    29    10    22    23    25];


for j=1:numel(mesh_nodes)
    path_cnt=1;
    for i=1:numel(ga)
        % Loop 1, how many bands
        for nchannel=1:numel(bands)
            
            a=1:numel(bands);
            band_combination=nchoosek(a,nchannel);
            
            [nm,bn]=size(band_combination);
            bc_store=band_combination;
            bc_store(:,bn+1:4)=zeros(nm,4-bn);
            
            % Loop 2, different combination of a number(nchannel) of channels
            for combn=1:nm
                
                
                % Generate adjancy matrix for shortest path calculation
                comb_adj=R_link(:,:,band_combination(combn,:));
                comb_adj=sum(comb_adj,3);
                comb_adj(comb_adj>0)=1;
                comb_adj(comb_adj==0)=1000000;
                
                
                
                
                
                
                
                [path,dist]=dijkstraties(comb_adj,ga(i),mesh_nodes(j));
                
                
                % Store shortest path from mesh node to a gateway node
                
                
                % Put path in to list not cell
                for path_i=1:numel(path)
                    % Store shortest path from mesh node to a gateway node
                    % mesh, ga, hop, path number,channels
                    temp(1)=mesh_nodes(j);
                    temp(2)=ga(i);
                    temp(3)=dist;
                    temp(4)=path_cnt;
                    %result_store(path_cnt,:)=[result_store(path_cnt,:) bc_store(combn,:)]
                    result_store(path_cnt,:)=[temp bc_store(combn,:)];
                    path_store{path_cnt}=path{(path_i)};
                    path_cnt=path_cnt+1;
                end
                % Store these paths in path store in a cell constructer
                %celldisp(path_store)
            end
            
            
            
            
            
            
            
            
            
            % End loop2, channel combination
        end
        
        
        
        % End loop 1, bands amount
    end
    
    
    % result_store has all the possible shortest path from a mesh node to
    % all gateway node, path_store has all the path with a unique number in
    % result_store
    
    
    
    
    
    
    
    
    % Have the path info, need to calculate the interference path over
    % network
    
         p_index=find(result_store(:,3)==min(result_store(:,3)));
        % Path number
        path_index=result_store(p_index,4);
        temp_band=result_store(p_index,5:4+numel(bands));
    
    
    path_flag=0;
    while(path_flag==0)
        
        

        
        
        no_qua_path=[];
        path_pen_comb=[];
        % Calculate all path efficiency
        for pen_i=1:numel(p_index)
            
            temp_channel=temp_band(pen_i,:);
            temp_channel=temp_channel(temp_channel>0);

            
            
     
            temp_path=path_store{path_index(pen_i)};
            
            path_pen=0;
            path_band=[];
            
            temp_act=act_link;
            
            % Calculate one path efficiency
            p_b_flag=1;% Mark if the path is qualified
            for pen_j=2:numel(path_store{(path_index(pen_i))})
                
                
                temp_link=temp_path(pen_j-1:pen_j);
                
                %temp_path_node=path_store{(path_index(pen_i))};
                temp_path_node=temp_path
                
                link_pen_comb=[];
                % Calculate efficiency for a link in different band, the link
                % is the same one in the path, so choose the minimum
                % interference value
                
                for band_i=1:numel(temp_channel)
                    % Channel combination need to tell which band works for
                    % this
 
                                        
                    if(sum(act_link(temp_link(1),:,temp_channel(band_i)))==1 && act_link(temp_link(1),temp_link(2),temp_channel(band_i))==0)
                        
                        p_b_flag=0;
                        temp_pen_value=1000000;
                    else
                        temp_pen_band=reshape(R_i(temp_link(1),temp_link(2),:,:,temp_channel(band_i)),size(Ad_d1)).*temp_act(:,:,temp_channel(band_i)).*weight(:,:,temp_channel(band_i));
                        temp_pen_value=sum(sum(temp_pen_band));
                        % Data construction: pen_value, band
                    end
                    
                    
                    
                    
                    link_pen_comb=[link_pen_comb;[temp_pen_value temp_channel(band_i)]];
                    
                    
                    
                end
                
                link_pen_min=link_pen_comb(link_pen_comb(:,1)==min(link_pen_comb(:,1)),:);
                
                
                % Pick up the first one
                link_pen_result=link_pen_min(1,:)
                path_pen=path_pen+(pen_j-1)*link_pen_result(1);
                path_band=[path_band link_pen_result(2)];
                
                % Update temp_act, when choose a path, update the radios
                temp_act(temp_link(1),temp_link(2),link_pen_result(2))=1;
                temp_act(temp_link(2),temp_link(1),link_pen_result(2))=1;
                
                
                %temp_act=
                
                
                % End a path pen calculation
            end
            
            
            if(p_b_flag==0)
                path_flag=0;
                no_qua_path=[no_qua_path path_index(pen_i)];
            else
                path_flag=1;
                
            
            
            path_pen_comb=[path_pen_comb path_pen];
            % path_store{path_cnt}=path{(path_i)};
            
            band_store{pen_i}=path_band(:);
            
            end
            
            % End all the paths and stored in path_pen_comb
        end
        
        no_qua_path
        
        if(numel(no_qua_path)>0)
            %path_store(no_qua_path)=[];
            
            for rest_i=1:numel(no_qua_path)
                rest_index=find(result_store(:,4)==no_qua_path(rest_i))
                result_store(rest_index,:)=[];
            end

         
        end
        % Choose the path with least links as candidates, may need to increase
        % the size of candidates
        p_index=find(result_store(:,3)==min(result_store(:,3)));
        % Path number
        path_index=result_store(p_index,4);
        temp_band=result_store(p_index,5:4+numel(bands));
        
        
    % End of while to find a qualify path  
    end
    
    
    

    
    % FIXME
    % Choose a path
    %path_flag=0;
    % while(path_flag>0)
    c_path_index=find(path_pen_comb==min(path_pen_comb));
    path_chosen_index=c_path_index(1);
    path_chosen=path_store{path_index(path_chosen_index)}
    bands_chosen=band_store{(path_chosen_index)}
    
    
    
    
    
    
    
    
    
    % Update active links and remove radios
    for chosen_i=2:numel(path_chosen)
        act_link(path_chosen(chosen_i-1),path_chosen(chosen_i),bands_chosen(chosen_i-1))=1;
        act_link(path_chosen(chosen_i),path_chosen(chosen_i-1),bands_chosen(chosen_i-1))=1;
        
        
        % FIXME
        % Should not cut the channel for future connection
        % Different from the other code, here since we use a custom
        % dijkstra code, does not work means a high value
        weight(path_chosen(chosen_i-1),:,bands_chosen(chosen_i-1))=weight(path_chosen(chosen_i-1),:,bands_chosen(chosen_i-1))+1;
        weight(:,path_chosen(chosen_i-1),bands_chosen(chosen_i-1))=weight(:,path_chosen(chosen_i-1),bands_chosen(chosen_i-1))+1;
        weight(path_chosen(chosen_i),:,bands_chosen(chosen_i-1))=weight(path_chosen(chosen_i),:,bands_chosen(chosen_i-1))+1;
        weight(:,path_chosen(chosen_i),bands_chosen(chosen_i-1))=weight(:,path_chosen(chosen_i),bands_chosen(chosen_i-1))+1;
        
        act_dtst=sum(act_link,3);
Pa=biograph(act_dtst);
tmp=view(Pa);
    end
    
    
    
    
    % End of mesh node
end
        
act_dtst=sum(act_link,3);
Pa=biograph(act_dtst);
view(Pa)
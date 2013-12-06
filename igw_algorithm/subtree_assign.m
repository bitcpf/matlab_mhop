function [sub_ga,sub_tshar]=subtree_assign(subtree,sub_ga,bands,serve_nodes,Ad_multi,a_degree,rs_demand_d,rs_demand_u,l_cap,tshar)


start_point=sub_ga;
% Get the subtree adjacent matrix
sub_ad_multi=Ad_multi(subtree,subtree,:);
%  Initialize time share of the sub tree
sub_tshar=tshar(subtree,subtree);
sub_dd=rs_demand_d(subtree);
sub_du=rs_demand_u(subtree);
sub_dd(sub_ga)=0;
sub_du(sub_ga)=0;
serve_l=[];
% Get subtree degree

clear temp
temp=sub_ad_multi;
Ad_nhop=temp;
[m,n]=size(temp);
for tk=1:a_degree
    
    
    for ti=1:m
        for tj=1:n
            if(temp(ti,tj)==1)
                Ad_nhop(ti,:)=Ad_nhop(ti,:)+temp(tj,:);
            end
        end
        Ad_nhop(ti,ti)=0;
    end
    
end

Ad_nhop(Ad_nhop>0)=1

% temp_degree is the degree of the subtree, take care of the index
temp_degree=sum(Ad_nhop);
temp_degree(start_point)=0;





while(sum(sub_tshar(start_point,:,:))+sum(sub_tshar(:,start_point,:))<1)
    % Check if the demand of the subtree still exist
    if (sum(sub_dd)+sum(sub_du))==0
        break;
        
        % Check if all 1 hop nodes has been served 
    elseif sum(sub_ad_multi(start_point,:,:))==sum(serve_l)
        % Need to do interation
        % Find new virtual gateway,and new subtree
        tmp_v_ga=find(temp_degree==max(temp_degree))
        
        break;
       
        
        % Check 1 hop demand status
    else
        for j=1:numel(bands)% Assign from high freq
            tmp_rs_time=(1-sum(sub_tshar(start_point,:,j))-sum(sub_tshar(:,start_point,j)))
            tmp_rs_cap=l_cap(j)*tmp_rs_time
            
            
            
            if tmp_rs_time>0;
                
                index=find(sub_ad_multi(start_point,:,j)==1);
                % Check if has 1 hop node in this band
                if numel(index)==0
                    continue
                end
                % Choose the node with lowest degree
                tmp_next_degree=temp_degree;
                % Use a big No. to exclude served node
                tmp_next_degree(serve_l)=10000
                next_node=find(tmp_next_degree(index)==min(tmp_next_degree(index)))
                next_node=subtree(index(next_node(1)))
                serve_l=[serve_l next_node]
                
                % Assign capacity to next node
                if (sub_dd(next_node)+sub_du(next_node)) < tmp_rs_cap
                    % the start point has the capacity to satisfy, satisfy
                    % all the demand
                    sub_tshar(start_point,next_node,j)=sub_tshar(start_point,next_node,j)+sub_dd(next_node)/l_cap(j)
                    sub_dd(next_node)=0;
                                       
                    sub_tshar(next_node,start_point,j)=sub_tshar(next_node,start_point,j)+sub_du(next_node)/l_cap(j)
                    sub_du(next_node)=0;
                    
               
                % Remaining capacity less than the total, since the remaining capacity could no be 0 in the loop     
                elseif sub_dd(next_node)<=tmp_rs_cap 
                    sub_tshar(start_point,next_node,j)=sub_tshar(start_point,next_node,j)+sub_dd(next_node)/l_cap(j)
                    
                    
                    sub_tshar(next_node,start_point,j)=sub_tshar(next_node,start_point,j)+(tmp_rs_cap-sub_dd(next_node))/l_cap(j)
                    
                    sub_du(next_node)=sub_du(next_node)-(tmp_rs_cap-sub_dd(next_node));
                    sub_dd(next_node)=0;
                else
                    sub_tshar(start_point,next_node,j)=sub_tshar(start_point,next_node,j)+tmp_rs_cap/l_cap(j)
                    sub_dd(next_node)=sub_dd(next_node)-tmp_rs_cap
                    break;
                
                end
                
                
                
                
            else
                break;
            end
            
        end
    end
    
end
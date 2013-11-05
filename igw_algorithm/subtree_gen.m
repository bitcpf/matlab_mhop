% Function generate subtree 



function [subtree_out,out_ga,serve_nodes]=subtree_gen(a_degree,serve_rate,ga_cap,bands,start_point,demandd,demandu,serve_nodes,igw_degree,Ad_multi)
    
subtree_serve_node=start_point;
temp_ga=start_point;

    subtree_igw_degree=igw_degree;
    
    subtree_igw_degree(serve_nodes)=0;
    
    sub_tree_Ad_multi=Ad_multi;
    sub_tree_Ad_multi(:,serve_nodes,:)=0
    
    if find(serve_nodes==start_point)
            error('Start Point already in served nodes')
    elseif sum(sub_tree_Ad_multi(start_point,:,:))==0
        serve_nodes=[serve_nodes start_point];
        out_ga=start_point;
        subtree_out=start_point;
    else
        serve_nodes=[serve_nodes start_point]; 
    end
        
    % 1 hop degree 
    Ad_d1=sum(Ad_multi,3);
    Ad_d1(Ad_d1>0)=1;
            
        
for i=1:numel(bands)
    while (sum(demandd(subtree_serve_node))+sum(demandu(subtree_serve_node))-demandd(temp_ga)-demandu(temp_ga)) < serve_rate*ga_cap
        if numel(serve_nodes)<numel(igw_degree)
            if sum(sub_tree_Ad_multi(start_point,:,i))>0
                
                % Find the 1 hop connection of start point, high freq first
                index=find(sub_tree_Ad_multi(start_point,:,i)==1);
                % Choose the node with most n hop degree, since they have more
                % connection can transfer flow to other nodes
                index_igw=find(subtree_igw_degree(index)==max(subtree_igw_degree(index)));
                next_node=index(index_igw(1));
                % Store new node to subtree and total served nodes
                subtree_serve_node=[subtree_serve_node next_node];
                serve_nodes=[serve_nodes next_node];
                
                % Update IGW degree by removing served nodes
                
                clear temp
                temp=Ad_d1(subtree_serve_node,:)
                temp=temp(:,subtree_serve_node)
                [m,n]=size(temp);
Ad_nhop=temp;

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

Ad_nhop(Ad_nhop>0)=1;
                temp_degree=sum(Ad_nhop);
                
                tempga_index=find(temp_degree(subtree_serve_node)==max(temp_degree(subtree_serve_node)));
                % temp_ga is the node in the subtree with most adjancy
                % connection.
                temp_ga=subtree_serve_node(tempga_index(1));
                % Update igw_degree matrix and Ad_multi matrix
                subtree_igw_degree(next_node)=0;
                sub_tree_Ad_multi(start_point,next_node,i)=0
                
                % need to think about the stop rule when all the demand are
                % served
                out_ga=temp_ga;
            elseif start_point~=temp_ga
                start_point=temp_ga;
                out_ga=temp_ga;
            else
                temp=subtree_serve_node;
                temp(find(temp==start_point))=[];
                tmp=max(igw_degree(temp)==max(igw_degree(temp)));
                start_point=temp(tmp);
                sub_tree_Ad_multi(start_point,subtree_serve_node,i)=0;
                out_ga=temp_ga;
                clear temp
                clear tmp
            end
        else
            
            break
        end
        if sum(demandd(subtree_serve_node))+sum(demandu(subtree_serve_node))-demandd(temp_ga)-demandu(temp_ga) >= serve_rate*ga_cap
            subtree_out=subtree_serve_node;
            subtree_serve_node=[];
            break
        end
    end
end
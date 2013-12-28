% HOP BY HOP Algorithm

% Following implement the hoho algorithm
 clear all
 close all
 load test


% Inilize
s_current=ga;
n_served=[];
n_unserved=MN;
n_unserved(ga)=[];
mesh_nodes=n_unserved;
act_link=R_link*0;
back_Ad_multi=Ad_multi;

% Delete ga in nodes

layer=[ga; zeros(1,numel(ga));ga];

% First initial loop,BSF initialize
for s=1:length(MN)
    
    clear s_next
    g_current=s_current(s);
    s_next(1,:)=1:numel(MN);;
    s_next(2,:)=Ad_d1(g_current,:);
    s_next(3,:)=Ad_nhop(g_current,:);
    s_next(:,ga)=[];
    
    % remove served
    for sv=1:numel(s_current)
        sv_index=find(s_next(1,:)==s_current(sv));
 %       if numel(sv_index)>0
        s_next(:,sv_index)=[];
  %      end
    end
    
    s_next=s_next(:,s_next(2,:)>0);
    s_next=sortrows(s_next',3)';
    
    for l=1:length(s_next(1,:))
        
        next=s_next(1,l);
        clear pen_can
        for can_i=1:numel(s_current)
            can_ga=s_current(can_i);
            channel=Ad_multi(can_ga,next,:);
            index_channel=find(channel==1);        
            % Calculate PEN of each channel
            if numel(index_channel)==0
                pen=[];
            else
            clear pen
            end
            
        for i=1:length(index_channel)
            % Pick up the channel
            temp=index_channel(i);
            dector=reshape(R_i(can_ga,next,:,:,temp),size(Ad_d1)).*act_link(:,:,temp);
            
            pen(i,:)=[temp;sum(dector(:))];
        end
        if numel(pen)>0
        pen=sortrows(pen,2);
        
        pen_can(can_i,:)=[can_ga,pen(1,1),pen(1,2)];
        end
        end
        % Delete node with no connection
        pen_can(pen_can(:,1)==0,:)=[];
        
        
        % Pen_can_next:node, channel, PEN value
        pen_can=sortrows(pen_can,3);
        pen_can_min_index=find(pen_can(:,3)==min(pen_can(:,3)));
        pen_can_next=pen_can(pen_can_min_index,:);
        pen_can_next=sortrows(pen_can_next,2);
        
        % Assign channel to node

         act_link(pen_can_next(1,1),next,pen_can_next(1,2))=1;
         act_link(next,pen_can_next(1,1),pen_can_next(1,2))=1;
         % Remove the radio
         Ad_multi(next,:,pen_can_next(1,2))=0;
         Ad_multi(:,next,pen_can_next(1,2))=0;
         Ad_multi(pen_can_next(1,1),:,pen_can_next(1,2))=0;
         Ad_multi(:,pen_can_next(1,1),pen_can_next(1,2))=0;

         
         s_current=[s_current, next];
         lay_index=find(layer(1,:)==pen_can_next(1,1))
         %layer=[layer, [next;layer(2,s)+1;pen_can_next(1,1)]]
        layer=[layer, [next;layer(2,lay_index)+1;pen_can_next(1,1)]]
        
 
        
    end
    
    
end

available_multi=Ad_multi;
Ad_multi=back_Ad_multi;
act_d1=sum(act_link,3);



% Phase 2, Adjust the channel assignment
weight=[];

for top=1:numel(layer(2,:))  
%top=1;
leaf_index=find(layer(2,:)>layer(2,top));
top_node=layer(1,top);
leaf=layer(1,leaf_index);
stack(top)=top_node;
flag=1;
re=[];

A=act_d1([top_node,leaf],[top_node,leaf]);

if numel(A)>1
top_cnt=1;
stack_cnt(top_cnt)=1;
while top_cnt~=0
    prelen=length(stack_cnt);
    i=stack_cnt(top_cnt);
    for j=1:numel(leaf)+1
        
        if A(i,j)==1 && isempty(find(flag==j,1))
            top_cnt=top_cnt+1;
            stack_cnt(top_cnt)=j;
            flag=[flag j];
            re=[re;i j];
            break;
        end
    end
    if length(stack_cnt)==prelen
        stack_cnt(top_cnt)=[];
        top_cnt=top_cnt-1;
    end
end
if numel(re)>0
weight=[weight;top_node numel(re(:,1))];
else
    
weight=[weight;top_node 0];
end

else
    weight=[weight;top_node 0];

end

end
fs2_weight=sortrows(weight,1)

% Layer contents: rows: node no., layer, gate connected

%layer=sortrows(layer',1)


% Load balance process
% 
% P=biograph(act_d1)
% view(P)









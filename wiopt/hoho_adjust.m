% Trees contents: columns: node no., layer amount, gateway connected,weight


trees=[sortrows(layer',1) fs2_weight(:,2)];

layer_amount=max(trees(:,2));
for i=1:layer_amount
    index=find(trees(:,2)==(layer_amount-i+1));
    layer_nodes=trees(index,:);
    
    can_index=find(trees(:,2)<layer_amount-i+1);
    can_nodes=trees(can_index,:);
    pen_can=[];
    
    for ii=1:numel(index)
        
        p=1;
        for j=1:numel(can_index)
            
            n_last=layer_nodes(ii,1)
            p_node=can_nodes(j,1);
            
            channel=available_multi(n_last,p_node,:);
            index_channel=find(channel==1)
            % Calculate PEN of each channel
            %             if numel(index_channel)==0
            %                 pen=[];
            %             else
            %                 pen
            %             end
            pen=[];
            
            % Pen_can_next:node, channel, PEN value
            
            for k=1:length(index_channel)
                % Pick up the channel
                temp=index_channel(k);
                dector=reshape(R_i(n_last,p_node,:,:,temp),size(Ad_d1)).*act_link(:,:,temp);
                
                pen(k,:)=[temp;sum(dector(:))];
            end
            if numel(pen)>0
                pen=sortrows(pen,2);
                
                pen_can(p,:)=[p_node,pen(1,1),pen(1,2)];
                p=p+1;
            end
            
            
            
        end
        
        
        
        
        if numel(pen_can)>0
            t_index=pen_can(:,1);
            pen_can=[pen_can trees(t_index,2)];
            
            
            % Pen_can_next:node, channel, PEN value,layer
            % Sort layer
            pen_can=sortrows(pen_can,4);
            pen_can_min_index=find(pen_can(:,4)==min(pen_can(:,4)));
            
            
            
            pen_can_next=pen_can(pen_can_min_index,:);
            pen_can_pen_index=find(pen_can_next(:,3)==min(pen_can_next(:,3)));
            
            pen_can_pen=pen_can_next(pen_can_pen_index,:);
            pen_can_pen=sortrows(pen_can_next,3);
            
        else
            pen_can_pen=[];
        end
        
        
        
        if numel(pen_can_pen)>0
            % Assign channel to node
            if pen_can_pen(1,4)<=layer_nodes(ii,2)
                
                %if pen_can_pen(1,3)<=current_pen
                
                % Reopen the channel for others
                % t_index is current occupacy channel
                temp=reshape(act_link(n_last,:,:),numel(MN),numel(bands));
                [n,t_index]=find(temp==1);
                
                % Process when multi node selected, when the node has
                % children
                process_index=find(trees(n,2)==min(trees(n,2)));
                n=n(process_index(1));
                t_index=t_index(process_index(1));
                
                
                current_pen=reshape(R_i(n_last,n,:,:,t_index),size(Ad_d1)).*act_link(:,:,t_index);
                current_pen=sum(current_pen(:));
                
                
                % Pen_can_pen:node, channel, PEN value,layer
                if pen_can_pen(1,3)*(pen_can_pen(1,4)+1)^2<=(current_pen-2)*layer_nodes(ii,2)^2
                    
                    pen_index=find(pen_can_pen(:,3)==min(pen_can_pen(:,3)));
                    pen_temp=pen_can_pen;
                    pen_can_pen=[];
                    pen_can_pen=pen_temp(pen_index,:)
                    
                    pen_index=find(pen_can_pen(:,2)==min(pen_can_pen(:,2)));
                    pen_temp=pen_can_pen;
                    pen_can_pen=[];
                    pen_can_pen=pen_temp(pen_index,:)

                    
                    
                    pen_can_loc=MN_loc(pen_can_pen(:,1),:);
                    n_last_loc=MN_loc(n_last,:);
                    
                    n_pen_dis=sum(((repmat(n_last_loc,numel(pen_can_loc(:,1)),1)-pen_can_loc).^2),2);
                    %n_pen_dif=sum((repmat(n_last_loc,numel(pen_can_loc(:,1),1),1)-pen_can_loc).^2,2)
                    pen_can_pen(:,5)=n_pen_dis;
                    
                    pen_act_d1=sum(act_link,3);
                    
                    weightupdate=penweight(pen_act_d1,trees(:,1:3)')
                    
                    pen_can_pen(:,6)=weightupdate(pen_can_pen(:,1),2)
                    
                    pen_index=find(pen_can_pen(:,6)==min(pen_can_pen(:,6)));
                    pen_temp=pen_can_pen;
                    pen_can_pen=[];
                    pen_can_pen=pen_temp(pen_index,:)
                    
                    pen_can_pen=sortrows(pen_can_pen,5)
                  
                    
                    
                    
                    % Debug
%                      tst=sum(act_link,3)
%                     tstp=biograph(tst)
%                      view(tstp)
%                     n_last
%                     pen_can_pen
%                     available_multi(9,:,2)
%                     trees(n_last,:)
                    
                    
                    
                    
                    trees(n_last,2)=pen_can_pen(1,4)+1;
                    trees(n_last,3)=pen_can_pen(1,1);
                    trees(n,4)=trees(n,4)-1;
                    %trees(trees(n_last,3),4)=trees(trees(n_last,3),4)-1
                    
                    
                    act_link(n_last,n,t_index)=0;
                    act_link(n,n_last,t_index)=0;
                    
                    % Put the occupacied channel back
                    available_multi(n_last,:,t_index)=Ad_multi(n_last,:,t_index);
                    available_multi(:,n_last,t_index)=Ad_multi(:,n_last,t_index);
                    available_multi(n,:,t_index)=Ad_multi(n,:,t_index);
                    available_multi(:,n,t_index)=Ad_multi(:,n,t_index);
                    
                    act_index=find(Ad_multi(n,:,t_index)==1)
                    
                    
                    idx_po=sum(act_link(act_index,:,t_index),1)
                    idx_po2=find(idx_po==1)
                    available_multi(idx_po2,:,t_index)=0
                    available_multi(:,idx_po2,t_index)=0
                    
                    for rv=1:numel(idx_po2)
                        idx_rv=[];
                        idx_rv=find(act_link(act_index,idx_po2(rv),t_index)==1)
                        
                        available_multi(idx_rv,:,t_index)=0
                        available_multi(:,idx_rv,t_index)=0
                    end
                    
                    act_index=find(Ad_multi(n_last,:,t_index)==1)
                    idx_po=sum(act_link(act_index,:,t_index),1)
                    idx_po2=find(idx_po==1)
                    available_multi(idx_po2,:,t_index)=0
                    available_multi(:,idx_po2,t_index)=0
                    
                    
                    for rv=1:numel(idx_po2)
                        idx_rv=[];
                        
                        idx_rv=find(act_link(act_index,idx_po2(rv),t_index)==1)
                        
                        available_multi(idx_rv,:,t_index)=0
                        available_multi(:,idx_rv,t_index)=0
                    end
                    
                    n_last
                    pen_can_pen(1,1)
                    pen_can_pen(1,2)
                    act_link(pen_can_pen(1,1),n_last,pen_can_pen(1,2))=1;
                    act_link(n_last,pen_can_pen(1,1),pen_can_pen(1,2))=1;
                    % Remove the radio
                    
                    % Pen_can_pen:node, channel, PEN value,layer
                    available_multi(n_last,:,pen_can_pen(1,2))=0;
                    available_multi(:,n_last,pen_can_pen(1,2))=0;
                    available_multi(pen_can_pen(1,1),:,pen_can_pen(1,2))=0;
                    available_multi(:,pen_can_pen(1,1),pen_can_pen(1,2))=0;
                end
                
            end
        end
        pen_can=[]
    end
    
    
    
end




% Location adjust
index=find(trees(:,2)>0);





% 
% act_dtst=sum(act_link,3);
% Pa=biograph(act_dtst);
% view(Pa)
% 


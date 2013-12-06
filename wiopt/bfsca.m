% BFS CA


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
        next=s_next(1,l)
        channel=Ad_multi(g_current,next,:);
        index_channel=find(channel==1);
        % Calculate PEN of each channel
        clear pen
        for i=1:length(index_channel)
            % Pick up the channel
            temp=index_channel(i);
            dector=reshape(R_i(g_current,next,:,:,temp),size(Ad_d1)).*act_link(:,:,temp);
            
            pen(i,:)=[temp;sum(dector(:))];
        end
        pen=sortrows(pen,2);
        act_link(g_current,next,pen(1))=1;
        s_current=[s_current, next]
        
        
        
    end
    
    
end
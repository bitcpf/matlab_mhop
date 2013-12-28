% CCA
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
        can_i=s;
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
            temp=index_channel(i)
            dector=reshape(R_i(can_ga,next,:,:,temp),size(Ad_d1)).*act_link(:,:,temp);
            sum(dector(:))
            pen(i,:)=[temp;sum(dector(:))];
        end

     pen
     next
     can_ga
        
        % Assign channel to node
        
if numel(pen)>0
         act_link(can_ga,next,pen(1,1))=1;
         act_link(next,can_ga,pen(1,1))=1;
         % Remove the radio
         Ad_multi(next,:,pen(1,1))=0;
         Ad_multi(:,next,pen(1,1))=0;
         Ad_multi(can_ga,:,pen(1,1))=0;
         Ad_multi(:,can_ga,pen(1,1))=0;
else
    break

end         
         s_current=[s_current, next];

        
        
    end
    
    
end



available_multi=Ad_multi;
Ad_multi=back_Ad_multi;
act_d1=sum(act_link,3);
% Pbfs=biograph(act_d1)
% view(Pbfs)
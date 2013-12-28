
% Matlab scritp to implement the Degree method for gateway placement
% Generate regular grid
% Temporary use uniform demand of all node, could be modified later
% Use Arbitrary link capacity and no inter node interference right now,
% could be modified later according to the interference range defined

clear all
close all

out_maxv=[];
% Arbitrary grid for debugging
  %N_x=3;
 for N_x=1:6
     clear act_link
     clear R_i
     clear R_link
     clear MN
     
  N_y=10;
  ga_fl=1;
  p_th=-160;
% Define bands used in algorithm, high freq first

  bands=[5.8*10^9,2.4*10^9,900*10^6,450*10^6];
%  bands=[2.4*10^9,2.4*10^9,2.4*10^9,2.4*10^9];
  
  % According to bands, we can calculate link capacity range and
  % interference range
  % Define single link capacity and threshold in the future need to define
    % inter node interference distance
    % Temporary define uniform capacity
    % High freq first
    l_cap=6*ones(1,numel(bands));
 % Frii model to calculate the communication range
   c_range=1/4/pi/10^(p_th/20)./bands*300000;
   c_range(bands<10^9)=c_range(bands<10^9)/2;
  c_range(bands<5*10^8)=c_range(bands<5*10^8)/1.5
   i_range=c_range*2;

 


% Generate grid and capacity according to distance
[X,Y]=meshgrid(1:300:300*N_x,1:300:300*N_y);

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

ga=round(rand(1,numel(MN)/numel(bands)/1.2)*numel(MN));
ga=unique(ga);
if ga==0
    ga=round(numel(MN)/2);
end



% Generate 1 hop capacity between every mesh node, R_link(node, node, band)
for b=1:length(bands)
for i=1:length(MN_loc(:,1))
    for j=1:length(MN_loc(:,1))
        dis_temp(i,j)=sqrt((MN_loc(i,1)-MN_loc(j,1))^2+(MN_loc(i,2)-MN_loc(j,2))^2);
        if(i==j)
            R_link(i,j,b)=0;
        elseif(dis_temp(i,j)<=c_range(b))
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
        Ni_interference=find(dist<=i_range(b));
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
%        R_i(i,:,i,:,:)=0;
%        R_i(i,:,:,i,:)=0;
        R_i(:,:,i,i,:)=0;
%        R_i(:,i,i,:,:)=0;
%        R_i(:,i,:,i,:)=0;
   
end


% Above are input



a_degree=2;
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

%Ad_nhop
%Ad_nhop(Ad_nhop>0)=1;

save test -v7.3




hoho










maxv=0;

[m,n,p]=size(act_link);

for i=1:m
    for j=1:n
        for p=1:p
            if(act_link(i,j,p)==1)
            link_value=sum(sum(R_i(i,j,:,:,p)));
            if(link_value>maxv)
                maxv=link_value;
            end
            end
      end
    end
end

out_maxv=[out_maxv maxv]


end
          
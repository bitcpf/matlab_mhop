% Matlab scritp to test Model from Dr. Rajan
% Use a 5x5 regular grid, 25 mesh nodes
% Use Arbitrary Demand generated randomly
% Use Arbitrary link capacity randomly

clear all
close all

% N_x=4;
% N_y=4;
for N_x=1:7
    for N_y=1:10
% Load Demand

clear MN_loc;
clear R_link;
clear demandu;
clear demandd;
clear excu;

demandu=ones(1,N_x*N_y);
%save 'D_rj.mat' demand;
%load D_rj;
demandd=demandu*2;
demandu=demandu*1.5;

% Generate grid and capacity according to distance
[X,Y]=meshgrid(1:500:500*N_x,1:500:500*N_y);



f_c=1;
for i=1:N_x
    for j=1:N_y
        MN_loc(f_c,1)=X(1,i);
        MN_loc(f_c,2)=Y(j,1);
        f_c=f_c+1;
    end
end

MN=1:(N_x*N_y);

% Define single link capacity and threshold
l_cap=6;
d_thre=500;

for i=1:length(MN_loc(:,1))
    for j=1:length(MN_loc(:,1))
        dis_temp(i,j)=sqrt((MN_loc(i,1)-MN_loc(j,1))^2+(MN_loc(i,2)-MN_loc(j,2))^2);
        if(i==j)
            R_link(i,j)=1000;
        elseif(dis_temp(i,j)<=d_thre)
            R_link(i,j)=l_cap;
        else
            R_link(i,j)=0;
        end
    end
    
end


excu=ones(length(MN),length(MN));
for i=1:length(MN)
    excu(i,i)=0;
end


excu=[MN(:) excu];
Rlink=[MN(:) R_link];
node_cap=ones(1,N_x*N_y)*11;
node_cap=[MN(:) node_cap(:)];

demandu=[MN(:) demandu(:)];
demandd=[MN(:) demandd(:)];

dlmwrite('demandu',demandu,' ');
dlmwrite('demandd',demandd,' ');
dlmwrite('mn',MN,' ');
dlmwrite('Rlink',Rlink,' ');
dlmwrite('nodecap',node_cap,' ');
dlmwrite('Excu',excu,' ');

!ampl singleband.mod

pth=[num2str(N_x) '_' num2str(N_y)];
mkcmd=['mkdir ar_loop/single' pth];
system(mkcmd);
mvcmd=['mv *.rt ' 'ar_loop/single' pth '/']
system(mvcmd);

    end
end
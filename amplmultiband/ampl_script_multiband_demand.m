% Matlab scritp to test Model from Dr. Rajan
% Use a 5x5 regular grid, 25 mesh nodes
% Use Arbitrary Demand generated randomly
% Use Arbitrary link capacity randomly

clear all
close all

% N_x=2;
% N_y=2;
Band=1:4;
for demandin=1:0.5:5
for N_x=1:1
    for N_y=10:10
% Load Demand

clear MN_loc;
clear R_link;
clear demandu;
clear demandd;
clear excu;
clear price_t;
clear price_c;

demandu=ones(1,N_x*N_y);
%save 'D_rj.mat' demand;
%load D_rj;
demandd=demandu*2;
demandu=demandu*1.5;

% Test for varying downlink demand
demandd(4)=demandd(3)+demandin-1;

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
        for k=1:length(Band)
            if(i==j)
                R_link(i,j,k)=1000;
                % Fixme in the future, need more threshold here
            elseif(dis_temp(i,j)<=d_thre)
                R_link(i,j,k)=l_cap;
            else
                R_link(i,j,k)=0;
            end
        end
    end
    
end


excu=ones(length(MN),length(MN));
for i=1:length(MN)
    excu(i,i)=0;
end

% Generate Tower Price
for i=1:length(MN)
    price_t(i)=10;
end

% Generate Radio Card Price
for i=1:length(Band)
    price_c(i)=1;
end

excu=[MN(:) excu];
% Rlink=[MN(:) R_link];


% Generate Rlink file for ampl
!rm Rlink

for i=1:length(Band)
    R_temp=R_link(:,:,i);
    R_temp=[MN(:) R_temp];
    dlmwrite('R_temp',R_temp,' ');
    fstline=['[*,*,' num2str(i),']: ' num2str(MN) ':='];
    rlink_cmd=['sed ''1 i' fstline ''' -i R_temp'];
    system(rlink_cmd);
    !cat R_temp >> Rlink
    
end


demandu=[MN(:) demandu(:)];
demandd=[MN(:) demandd(:)];
price_t=[MN(:) price_t(:)];
price_c=[Band(:) price_c(:)];


dlmwrite('Pt',price_t,' ');
dlmwrite('Pc',price_c,' ');
dlmwrite('demandu',demandu,' ');
dlmwrite('demandd',demandd,' ');
dlmwrite('mn',MN,' ');

dlmwrite('Excu',excu,' ');

!ampl multiband.mod

pth=['_' num2str(demandin)];
mkcmd=['mkdir vary_downlink/demand' pth];
system(mkcmd);
mvcmd=['mv *.rt ' 'vary_downlink/demand' pth '/']
system(mvcmd);

    end
end
end
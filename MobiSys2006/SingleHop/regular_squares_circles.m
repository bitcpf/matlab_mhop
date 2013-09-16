%REGULAR_SQUARES_CIRCLES.M
%This is a first order approximation of where to put meshboxes based on
%initial data and the premise that acceptable throughput can always be
%achieved over a certain minimum distance. This script proposes the
%coordinates for regularly spaced meshboxes to cover the entire Pecan Park
%neighborhood. Numrads is the approximate number of hops allowed.

function [validx,validy] = regular_squares_circles(rad,numrads,bridgerad,hcc,melcher)

% hcc = 1; %boolean indicating whether or not we have a directional link to hcc
% melcher = 1; %melcher directional link
ymca = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Transform Real Distance to Map Distance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% rad = 250; %250 meter radius
bridge_pixelrad = round(bridgerad/1.7);
pixelrad = round(rad/1.7); %we assume that acceptable throughput can be achieved over a distance
%of approximately 170 meters or 100 pixels on the map.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Locate Network Entry Points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tfax = 1540; %coordinates of TFA antenna
tfay = 910;

melcherx = 995; %coordinates of Melcher antenna
melchery = 960;

hccx = 680; %coordinates of possible HCC antenna
hccy = 1060;

ymcax = 1400; %coordinates of possible YMCA antenna
ymcay = 1300;

maxx = 2000; %maximum coordinates at which nodes could be placed
maxy = 1600;

%%%%%%%%%%%%%%%%%%%%%%%%
%Initial Node Placements
%%%%%%%%%%%%%%%%%%%%%%%%

[tfaxvec,tfayvec] = tesselate_squares(maxx,maxy,tfax,tfay,pixelrad); %tesselate the whole space
[melcherxvec,melcheryvec] = tesselate_squares(maxx,maxy,melcherx,melchery,pixelrad);
[hccxvec,hccyvec] = tesselate_squares(maxx,maxy,hccx,hccy,pixelrad);
[ymcaxvec,ymcayvec] = tesselate_squares(maxx,maxy,ymcax,ymcay,pixelrad);

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Make Vectors Equal Length
%%%%%%%%%%%%%%%%%%%%%%%%%%

% maxlen = max([length(tfaxvec),length(melcherxvec),length(hccxvec),length(ymcaxvec)]);
% 
% tfaxvec = zeropad(tfaxvec,maxlen);
% tfayvec = zeropad(tfayvec,maxlen);
% melcherxvec = zeropad(melcherxvec,maxlen);
% melcheryvec = zeropad(melcheryvec,maxlen);
% hccxvec = zeropad(hccxvec,maxlen);
% hccyvec = zeropad(hccyvec,maxlen);
% ymcaxvec = zeropad(ymcaxvec,maxlen);
% ymcayvec = zeropad(ymcayvec,maxlen);

%%%%%%%%%%%%%%%%%%%%%
%Remove Invalid Nodes
%%%%%%%%%%%%%%%%%%%%%

% boundary_validvec = pecan_park_boundary(xvec,yvec,0.5*pixelrad); %find which points are within the boundary
tfa_bound_validvec = pecan_park_boundary(tfaxvec,tfayvec,bridge_pixelrad);
melcher_bound_validvec = pecan_park_boundary(melcherxvec,melcheryvec,bridge_pixelrad);
hcc_bound_validvec = pecan_park_boundary(hccxvec,hccyvec,bridge_pixelrad);
ymca_bound_validvec = pecan_park_boundary(ymcaxvec,ymcayvec,bridge_pixelrad);

tfa_circle_validvec = circle_boundary(tfaxvec,tfayvec,tfax,tfay,numrads*pixelrad,-2);
if melcher
    melcher_circle_validvec = circle_boundary(melcherxvec,melcheryvec,melcherx,melchery,numrads*pixelrad,-2); %consider using numrads - 1 for non-TFA locations (extra hop to get back to TFA)
else
    melcher_circle_validvec = circle_boundary(melcherxvec,melcheryvec,melcherx,melchery,0,0);
end
if hcc
    hcc_circle_validvec = circle_boundary(hccxvec,hccyvec,hccx,hccy,numrads*pixelrad,-2);
else
    hcc_circle_validvec = circle_boundary(hccxvec,hccyvec,hccx,hccy,0,0);
end

if ymca
    ymca_circle_validvec = circle_boundary(ymcaxvec,ymcayvec,ymcax,ymcay,numrads*pixelrad,-2); 
else
    ymca_circle_validvec = circle_boundary(ymcaxvec,ymcayvec,ymcax,ymcay,0,0);
end

hccvalidvec = hcc_bound_validvec & hcc_circle_validvec;
melchervalidvec = melcher_bound_validvec & melcher_circle_validvec;
tfavalidvec = tfa_bound_validvec & tfa_circle_validvec;

% xvec = hccxvec;
% yvec = hccyvec;

% xvec = melcherxvec;
% yvec = melcheryvec;

% xvec = tfaxvec;
% yvec = tfayvec;

tfavalidx = tfaxvec(find(tfavalidvec));
tfavalidy = tfayvec(find(tfavalidvec));

melchervalidx = melcherxvec(find(melchervalidvec));
melchervalidy = melcheryvec(find(melchervalidvec));

hccvalidx = hccxvec(find(hccvalidvec));
hccvalidy = hccyvec(find(hccvalidvec));

validx = [tfavalidx; melchervalidx; hccvalidx];
validy = [tfavalidy; melchervalidy; hccvalidy];

%%%%%%%%%%%%%%%%%%%%%%%
%Remove Redundant Nodes
%%%%%%%%%%%%%%%%%%%%%%%

[temp,tfaindex] = min(sqrt((tfax - validx).^2 + (tfay - validy).^2)); %get the index of tfa
[temp,melcherindex]= min(sqrt((melcherx - validx).^2 + (melchery - validy).^2)); %index of melcher
[temp,hccindex] = min(sqrt((hccx - validx).^2 + (hccy - validy).^2)); %index of hcc

forbidden_list = tfaindex;
if melcher
    forbidden_list = [forbidden_list; melcherindex];
end
if hcc
    forbidden_list = [forbidden_list; hccindex];
end

[validx, validy] = merge_nodes(validx,validy,pixelrad*0.5,forbidden_list); %get rid of nodes that are too close togetherr
%These problem nodes arise from the "collision" of tesselations based at
%different points

num_nodes = length(validx); %number of nodes after final cut


[temp,tfaindex] = min(sqrt((tfax - validx).^2 + (tfay - validy).^2)); %get the index of tfa
[temp,melcherindex]= min(sqrt((melcherx - validx).^2 + (melchery - validy).^2)); %index of melcher
[temp,hccindex] = min(sqrt((hccx - validx).^2 + (hccy - validy).^2)); %index of hcc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Place Wired Nodes at Top of List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dummyvec = zeros(num_nodes,1);
% size(dummyvec)
dummyvec(tfaindex) = -10;
if hcc
    dummyvec(hccindex) = -8;
%     size(dummyvec)
end
if melcher
    dummyvec(melcherindex) = -9;
%     size(dummyvec)
end
[dummysort,sortindex] = sort(dummyvec);

% tfaindex
% hccindex
% melcherindex
% 
% size(dummyvec)
% size(sortindex)
% size(validx)

validx = validx(sortindex); %put the wired nodes at the beginning of the list
validy = validy(sortindex);

[temp,tfaindex] = min(sqrt((tfax - validx).^2 + (tfay - validy).^2)); %get the index of tfa
[temp,melcherindex]= min(sqrt((melcherx - validx).^2 + (melchery - validy).^2)); %index of melcher
[temp,hccindex] = min(sqrt((hccx - validx).^2 + (hccy - validy).^2)); %index of hcc

%%%%%%%%%%%%%%%%%%%%%
%Assess connectedness
%%%%%%%%%%%%%%%%%%%%%
neighborvec = number_neighbors(validx,validy,pixelrad*1.1); %find out how many neighbors each node has
connectmat = connectivity_mat(validx,validy,pixelrad*1.1);

% connectmat(tfaindex,melcherindex) = 1; %Account for directional antenna links
% connectmat(melcherindex,tfaindex) = 1; %in both directions
% connectmat(tfaindex,hccindex) = 1;
% connectmat(hccindex,tfaindex) = 1;

neighbor1 = find(neighborvec == 1); %list of nodes with 1 neighbor
neighbor2 = find(neighborvec == 2); %list of nodes with 2 neighbors
neighbor3 = find(neighborvec == 3); %...
neighbor4 = find(neighborvec == 4);
neighbor5 = find(neighborvec == 5);
neighbor6 = find(neighborvec == 6);

%Zero Hops (wired or directional link)
validnodes_0hop = zeros(num_nodes,1);
validnodes_0hop(tfaindex) = 1;
if melcher
validnodes_0hop(melcherindex) = 1;
end
if hcc
validnodes_0hop(hccindex) = 1;
end

validx_0hop = validx(find(validnodes_0hop));
validy_0hop = validy(find(validnodes_0hop));

%One Hop

tfa_1hop_vec = connectmat(:,tfaindex); %binary vec of node indices indicating connectedness to tfa
% tfa_1hop_vec(tfaindex) = tfa_1hop_vec; %make sure we're not looping

melcher_1hop_vec = connectmat(:,melcherindex)&melcher;
% melcher_1hop_vec(melcherindex) = 0;

hcc_1hop_vec = connectmat(:,hccindex)&hcc;
% hcc_1hop_vec(hccindex) = 0;

% validx_1hop = validx(find(tfa_1hop_vec)); %list of x coordinates of nodes connected to tfa
% validy_1hop = validy(find(tfa_1hop_vec)); %y coordinates

validnodes_1hop = (tfa_1hop_vec | melcher_1hop_vec | hcc_1hop_vec) & (~validnodes_0hop);

validx_1hop = validx(find(validnodes_1hop)); %list of x coordinates of nodes connected to tfa
validy_1hop = validy(find(validnodes_1hop)); %y coordinates

%Two Hops

tfa_2hop_vec = zeros(num_nodes,1); %preallocate vector to hold list of nodes reachable from tfa in 2 hops
melcher_2hop_vec = zeros(num_nodes,1);
hcc_2hop_vec = zeros(num_nodes,1);

for n = 1:num_nodes
    
    tfa_cur_node = tfa_1hop_vec(n); %select the first hop in the two hop path
    melcher_cur_node = melcher_1hop_vec(n);
    hcc_cur_node = hcc_1hop_vec(n);
    
    tfa_2hop_vec = (tfa_2hop_vec | (connectmat(:,n) & tfa_cur_node)); %make sure node is reachable by a neighbor
    %of tfa, but not reachable from tfa within one hop
    melcher_2hop_vec = (melcher_2hop_vec | (connectmat(:,n) & melcher_cur_node))&melcher;
    hcc_2hop_vec = (hcc_2hop_vec | (connectmat(:,n) & hcc_cur_node))&hcc;
    
end
% tfa_2hop_vec(tfaindex) = 0; %make sure that we're not accidentally looping
% melcher_2hop_vec(melcherindex) = 0;
% hcc_2hop_vec(hccindex) = 0;

validnodes_2hop = (tfa_2hop_vec | melcher_2hop_vec | hcc_2hop_vec) & (~validnodes_1hop) & (~validnodes_0hop);

validx_2hop = validx(find(validnodes_2hop));
validy_2hop = validy(find(validnodes_2hop));

%Three Hops

tfa_3hop_vec = zeros(num_nodes,1); %preallocate vector to hold list of nodes reachable from tfa in 2 hops
melcher_3hop_vec = zeros(num_nodes,1);
hcc_3hop_vec = zeros(num_nodes,1);

for n = 1:num_nodes
    
    tfa_cur_node = tfa_2hop_vec(n);
    melcher_cur_node = melcher_2hop_vec(n);
    hcc_cur_node = hcc_2hop_vec(n);
    
    tfa_3hop_vec = (tfa_3hop_vec | (connectmat(:,n) & tfa_cur_node)); %make sure we can't reach the node by a shorter path
    melcher_3hop_vec = (melcher_3hop_vec | (connectmat(:,n) & melcher_cur_node))&melcher;
    hcc_3hop_vec = (hcc_3hop_vec | (connectmat(:,n) & hcc_cur_node))&hcc;
    
end
% tfa_3hop_vec(tfaindex) = 0;

validnodes_3hop = (tfa_3hop_vec | melcher_3hop_vec | hcc_3hop_vec) & (~validnodes_2hop) & (~validnodes_1hop) & (~validnodes_0hop);

validx_3hop = validx(find(validnodes_3hop));
validy_3hop = validy(find(validnodes_3hop));


%%%%%%%%%%%%%%%%%%%%%%
%Visualization Section
%%%%%%%%%%%%%%%%%%%%%%

% circlemat = circles(maxx,maxy,[tfax; melcherx],[tfay; melchery],numrads*pixelrad);
circlemat = circles(maxx,maxy,validx,validy,bridge_pixelrad);
[circley,circlex] = find(circlemat);

map = imread('pecan_park_map.tif');
figure
image(map)
hold on
scatter(circlex,circley,'kx')
scatter(validx,validy,'go','filled')
axis ij
title(['Coverage Map: ' num2str(length(validx)) ' nodes, Max ' num2str(numrads) ' hops'])

%Predicting outages
validx1 = validx(neighbor1);
validy1 = validy(neighbor1);
validx2 = validx(neighbor2);
validy2 = validy(neighbor2);
validx3 = validx(neighbor3);
validy3 = validy(neighbor3);
validx4 = validx(neighbor4);
validy4 = validy(neighbor4);
validx5 = validx(neighbor5);
validy5 = validy(neighbor5);
validx6 = validx(neighbor6);
validy6 = validy(neighbor6);

circlemat1 = circles(maxx,maxy,validx1,validy1,bridge_pixelrad);
circlemat2 = circles(maxx,maxy,validx2,validy2,bridge_pixelrad);
circlemat3 = circles(maxx,maxy,validx3,validy3,bridge_pixelrad);
circlemat4 = circles(maxx,maxy,validx4,validy4,bridge_pixelrad);
circlemat5 = circles(maxx,maxy,validx5,validy5,bridge_pixelrad);
circlemat6 = circles(maxx,maxy,validx6,validy6,bridge_pixelrad);

[circley1,circlex1] = find(circlemat1);
[circley2,circlex2] = find(circlemat2);
[circley3,circlex3] = find(circlemat3);
[circley4,circlex4] = find(circlemat4);
[circley5,circlex5] = find(circlemat5);
[circley6,circlex6] = find(circlemat6);

figure
image(map)
hold on
scatter(circlex1,circley1,'rx')
scatter(validx1,validy1,'ro','filled')
scatter(circlex2,circley2,'mx')
scatter(validx2,validy2,'ro','filled')
scatter(circlex3,circley3,'cx')
scatter(validx3,validy3,'ro','filled')
scatter(circlex4,circley4,'bx')
scatter(validx4,validy4,'ro','filled')
scatter(circlex5,circley5,'gx')
scatter(validx5,validy5,'ro','filled')
scatter(circlex6,circley6,'kx')
scatter(validx6,validy6,'ro','filled')
title(['Connectedness Map: ' num2str(length(validx)) ' nodes, Max ' num2str(numrads) ' hops'])

circlemat_0hop = circles(maxx,maxy,validx_0hop,validy_0hop,bridge_pixelrad);
circlemat_1hop = circles(maxx,maxy,validx_1hop,validy_1hop,bridge_pixelrad);
circlemat_2hop = circles(maxx,maxy,validx_2hop,validy_2hop,bridge_pixelrad);
circlemat_3hop = circles(maxx,maxy,validx_3hop,validy_3hop,bridge_pixelrad);

[circley_0hop,circlex_0hop] = find(circlemat_0hop);
[circley_1hop,circlex_1hop] = find(circlemat_1hop);
[circley_2hop,circlex_2hop] = find(circlemat_2hop);
[circley_3hop,circlex_3hop] = find(circlemat_3hop);

figure
image(map)
hold on
scatter(circlex_3hop,circley_3hop,'rx')
scatter(circlex_2hop,circley_2hop,'bx')
scatter(circlex_1hop,circley_1hop,'gx')
scatter(circlex_0hop,circley_0hop,'kx')
scatter(tfax,tfay,'ko','filled')
scatter(validx_1hop,validy_1hop,'go','filled')
scatter(validx_2hop,validy_2hop,'bo','filled')
scatter(validx_3hop,validy_3hop,'ro','filled')
title(['Number of Hops Map: ' num2str(length(validx)) ' nodes, Max ' num2str(numrads) ' hops'])

%Plain plot of nodes with a boundary drawn around them
ax = 150;
ay = 850;
bx = 900;
by = 300;
cx = 1250;
cy = 300;
dx = 2050;
dy = 800;
ex = 1100;
ey = 1500;
figure
hold on
line([ax bx cx dx ex ax],[ay by cy dy ey ay])
scatter(validx,validy,'ko','filled')
scatter(validx(tfaindex),validy(tfaindex),'ro','filled')
if melcher
    scatter(validx(melcherindex),validy(melcherindex),'ro','filled')
end
if hcc
    scatter(validx(hccindex),validy(hccindex),'ro','filled')
end
axis ij
axis equal
title([num2str(length(validx)) ' nodes'])


%GPS_2_XY.M
%This function takes in a GPS coordinates and outputs x,y coordinates on
%the TFA map. It relies on triangulation between TFA, Melcher, Ben's House
%and Miguel's House.

function [x,y] = gps_2_xy(N,W)

%REMEMBER THAT GOING NORTH LOWERS THE Y COORDINATE
%GOING WEST DECREASES THE X COORDINATE
%The northwest corner of the map is the origin.

%%%%%%%%%%%%%%%%%%%%%%%%
% Conversion Constants %
%%%%%%%%%%%%%%%%%%%%%%%%

mperpix = 1.9; %meters per pixel

Nconst = 0.00054; %0.00054 minutes to one meter
Wconst = 0.00062; %0.00063 minutes to one meter

Nperpix = Nconst * mperpix; %minutes per pixel 
Wperpix = Wconst * mperpix; %minutes per pixel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Locate Well-Known Points %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tfax = 1540; %coordinates of TFA antenna
tfay = 910;

tfaN = 42.408;
tfaW = 16.754;

melcherx = 995; %coordinates of Melcher antenna
melchery = 960;

melcherN = 42.376;
melcherW = 17.360;

benx = 1336;
beny = 1003;

benN = 42.3408;
benW = 16.9926;

miguelx = 1280;
miguely = 765;

miguelN = 42.558;
miguelW = 17.044;

% maxx = 2000; %maximum coordinates at which nodes could be placed
% maxy = 1600;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Distances to Known Points %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%
% TFA %
%%%%%%%
tfaNdiff = tfaN - N; %should be negative if point is north of tfa
tfaWdiff = tfaW - W; %should be negative if point is west of tfa

tfaNpix = tfaNdiff/Nperpix; %number of pixels to count DOWN from tfay
tfaWpix = tfaWdiff/Wperpix; %number of pixels to count RIGHT from tfax

xtfa = tfax + tfaWpix; %x location relative to TFA
ytfa = tfay + tfaNpix; %y location relative to TFA

%%%%%%%%%%%
% Melcher %
%%%%%%%%%%%
melcherNdiff = melcherN - N;
melcherWdiff = melcherW - W;

melcherNpix = melcherNdiff/Nperpix;
melcherWpix = melcherWdiff/Wperpix;

xmelcher = melcherx + melcherWpix;
ymelcher = melchery + melcherNpix;

%%%%%%%%%%%%%%%
% Ben's House %
%%%%%%%%%%%%%%%
benNdiff = benN - N;
benWdiff = benW - W;

benNpix = benNdiff/Nperpix;
benWpix = benWdiff/Wperpix;

xben = benx + benWpix;
yben = beny + benNpix;

%%%%%%%%%%%%%%%%%%
% Miguel's House %
%%%%%%%%%%%%%%%%%%

miguelNdiff = miguelN - N;
miguelWdiff = miguelW - W;

miguelNpix = miguelNdiff/Nperpix;
miguelWpix = miguelWdiff/Wperpix;

xmiguel = miguelx + miguelWpix;
ymiguel = miguely + miguelNpix;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Negotiate Between the Four Locations %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x = round((xtfa + xmelcher + xben + xmiguel)/4);
% y = round((ytfa + ymelcher + yben + ymiguel)/4);

% x = round((xmelcher + xben + xmiguel)/3); %disregard TFA
% y = round((ymelcher + yben + ymiguel)/3);

% x = round((xtfa + xben + xmiguel)/3); %disregard Melcher
% y = round((ytfa + yben + ymiguel)/3);

% x = round((xtfa + xmelcher + xmiguel)/3); %disregard Ben's House
% y = round((ytfa + ymelcher + ymiguel)/3);

x = round((xtfa + xmelcher + xben)/3); %disregard Miguel's House
y = round((ytfa + ymelcher + yben)/3);

%%%%%%%%%%%%%
% Visualize %
%%%%%%%%%%%%%

% tfax
% xtfa
% x

if 0

map = imread('pecan_park_map.tif');
figure
hold on
image(map)
scatter(tfax,tfay,'bo','filled')
scatter(melcherx,melchery,'bo','filled')
scatter(benx,beny,'bo','filled')
scatter(miguelx,miguely,'bo','filled')

scatter(xtfa,ytfa,'go','filled')
line([tfax xtfa],[tfay ytfa])
scatter(xmelcher,ymelcher,'go','filled')
line([melcherx xmelcher],[melchery ymelcher])
scatter(xben,yben,'go','filled')
line([benx xben],[beny yben])

scatter(x,y,'ro','filled')
axis ij

end
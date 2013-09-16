%CIRCLEMAP.M
%This function puts circles of given radii at the vertices of equally
%spaced squares on a schematic map of Pecan Park.

function out = circlemap(rad)

%radius is in meters
pixelrad = round(rad/1.7); %this is a very rough conversion and needs to be improved

[validx,validy] = regular_squares(rad); %locate centers of squares

map = imread('pecan_park_map.tif');
[maxx,maxy,maxz] = size(map);

circlemat = circles(maxx,maxy,validx,validy,pixelrad);

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

% map = imread('pecan_park_map.tif');
% image(map)
% figure
% hold on
imagesc(circlemat)
hold on
scatter(validx,validy,'go','filled')
line([ax bx cx dx ex ax],[ay by cy dy ey ay])
axis ij
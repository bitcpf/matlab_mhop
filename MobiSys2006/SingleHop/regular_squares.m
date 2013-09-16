%REGULAR_SQUARES.M
%This is a first order approximation of where to put meshboxes based on
%initial data and the premise that acceptable throughput can always be
%achieved over a certain minimum distance. This script proposes the
%coordinates for regularly spaced meshboxes to cover the entire Pecan Park
%neighborhood.

function [validx,validy] = regular_squares(rad)

% rad = 250; %250 meter radius
pixelrad = round(rad/1.7); %we assume that acceptable throughput can be achieved over a distance
%of approximately 170 meters or 100 pixels on the map.

startx = 1540; %coordinates of TFA antenna
starty = 910;

maxx = 2000; %maximum coordinates at which nodes could be placed
maxy = 1600;

[xvec,yvec] = tesselate_squares(maxx,maxy,startx,starty,pixelrad); %tesselate the whole space

validvec = pecan_park_boundary(xvec,yvec,0.5*pixelrad); %find which points are within the boundary

validx = xvec(find(validvec)); %take only the points within the boundary
validy = yvec(find(validvec));

% length(validx)

map = imread('pecan_park_map.tif');
image(map)
hold on
scatter(validx,validy,'go','filled')
axis ij
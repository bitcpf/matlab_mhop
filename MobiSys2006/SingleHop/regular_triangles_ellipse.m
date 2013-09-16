%REGULAR_TRIANGLES_ELLIPSE.M
%This is a first order approximation of where to put meshboxes based on
%initial data and the premise that acceptable throughput can always be
%achieved over a certain minimum distance. This script proposes the
%coordinates for regularly spaced meshboxes to cover the entire Pecan Park
%neighborhood. Numrads is the approximate number of hops allowed.

function [validx,validy] = regular_triangles_ellipse(rad,numrads)

% rad = 250; %250 meter radius
pixelrad = round(rad/1.7); %we assume that acceptable throughput can be achieved over a distance
%of approximately 170 meters or 100 pixels on the map.

tfax = 1540; %coordinates of TFA antenna
tfay = 910;

melcherx = 995; %coordinates of Melcher antenna
melchery = 960;

maxx = 2000; %maximum coordinates at which nodes could be placed
maxy = 1600;

[xvec,yvec] = tesselate_triangles(maxx,maxy,tfax,tfay,pixelrad); %tesselate the whole space

boundary_validvec = pecan_park_boundary(xvec,yvec,0.5*pixelrad); %find which points are within the boundary

% tfa_circle_validvec = circle_boundary(xvec,yvec,tfax,tfay,numrads*pixelrad,0);
% melcher_circle_validvec = circle_boundary(xvec,yvec,melcherx,melchery,numrads*pixelrad,0);
ellipse_validvec = ellipse_boundary(xvec,yvec,tfax,tfay,melcherx,melchery,numrads*pixelrad,0);

validvec = boundary_validvec & (ellipse_validvec); %only allow points that lie in one of the circles

validx = xvec(find(validvec)); %take only the points within the boundary
validy = yvec(find(validvec));

% length(validx)

% circlemat = circles(maxx,maxy,[tfax; melcherx],[tfay; melchery],numrads*pixelrad);
% [circley,circlex] = find(circlemat);

% ellipsemat = ellipse(maxx,maxy,tfax,tfay,melcherx,melchery,numrads*pixelrad);
% [ellipsey,ellipsex] = find(ellipsemat);
% 
% map = imread('pecan_park_map.tif');
% image(map)
% hold on
% % scatter(circlex,circley,'b.')
% scatter(ellipsex,ellipsey,'b.')
% scatter(validx,validy,'go','filled')
% axis ij

circlemat = circles(maxx,maxy,validx,validy,pixelrad);
[circley,circlex] = find(circlemat);

map = imread('pecan_park_map.tif');
image(map)
hold on
scatter(circlex,circley,'kx')
scatter(validx,validy,'go','filled')
axis ij
title([num2str(length(validx)) ' nodes, Max ' num2str(numrads) ' hops'])
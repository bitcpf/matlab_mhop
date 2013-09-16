%CIRCLE_BOUNDARY.M
%This function takes in a point and returns a boolean indicating whether or
%not that point is within a circle with a given radius and center. The input coordinates should be in pixels.

function out = circle_boundary(x,y,centerx,centery,rad,tol)

xdist = abs(x(:) - centerx);
ydist = abs(y(:) - centery);

dist = sqrt(xdist.^2 + ydist.^2); %norm 2 distance from center

out = (dist <= (rad-tol));
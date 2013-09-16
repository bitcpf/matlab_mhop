%ELLIPSE_BOUNDARY.M
%This function takes in a point and returns a boolean indicating whether or
%not that point is within an ellipse with a given foci and "radius". The input coordinates should be in pixels.

function out = ellipse_boundary(x,y,f1x,f1y,f2x,f2y,rad,tol)

x1dist = abs(x(:) - f1x);
y1dist = abs(y(:) - f1y);

x2dist = abs(x(:) - f2x);
y2dist = abs(y(:) - f2y);

dist1 = sqrt(x1dist.^2 + y1dist.^2); %norm 2 distance from first focus
dist2 = sqrt(x2dist.^2 + y2dist.^2); %distance from second focus

out = ((dist1 + dist2) <= (rad-tol));
%MAKE_LINE.M
%Take in a vector of x coordinates, a slope, and a y intercept, and return
%the y coordinates corresponding to each x coordinate.

function yvec = make_line(xvec,yint,slope)

%y = mx + b

yvec = slope * xvec + yint;
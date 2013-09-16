%TESSELATE_SQUARES.M
%Given a matrix dimension and a leg length as well as a starting position, 
%this function will return the coordinates of the vertices of a regular 
%tesselation of polygons into the matrix. 

function [xvec,yvec] = tesselate_squares(xmax,ymax,startx,starty,r)

outmat = zeros(ymax,xmax); %preallocate the matrix with vertices

xlo = 1 + mod(startx,r); %this is the minimum x that will have a vertex
xhi = 1 + xmax - mod(xmax-startx,r); %maximum x that will have a vertex
xvec = xlo:r:xhi; %vector of possible x coordinates
xlen = length(xvec);

ylo = 1 + mod(starty,r);
yhi = 1 + ymax - mod(ymax-starty,r);
yvec = ylo:r:yhi;
ylen = length(yvec);

for n = 1:xlen
    
    curx = xvec(n);
    
    for m = 1:ylen
        
        cury = yvec(m);
        
        outmat(cury,curx) = 1; %place ones at each vertex
        
    end
    
end

[yvec,xvec] = find(outmat); %return vertices in vector form as well

% figure
% imagesc(outmat)


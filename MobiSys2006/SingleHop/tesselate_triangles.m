%TESSELATE_TRIANGLES.M
%Given a matrix dimension and a leg length as well as a starting position, 
%this function will return the coordinates of the vertices of a regular 
%tesselation of polygons into the matrix. 

function [xvec,yvec] = tesselate_triangles(xmax,ymax,startx,starty,r)

outmat = zeros(ymax,xmax); %preallocate the matrix with vertices

xstep = round(r/2);% 
xlo = 1 + mod(startx,xstep); %this is the minimum x that will have a vertex
xhi = 1 + xmax - mod(xmax-startx,xstep); %maximum x that will have a vertex
xvec = xlo:xstep:xhi; %vector of possible x coordinates
xlen = length(xvec);

[mindist,minindex] = min(abs(xvec - startx));
if mod(minindex,2)==1 %odd index of starting point
    xeven = 0;
else
    xeven = 1;
end

ystep = round(sqrt(3/4)*r); %I'm not sure this number is right!!!!
ylo = 1 + mod(starty,ystep);
yhi = 1 + ymax - mod(ymax-starty,ystep);
yvec = ylo:ystep:yhi;
ylen = length(yvec);

[mindist,minindex] = min(abs(yvec - starty));
if mod(minindex,2)==1 %odd index of starting point
    yeven = 0;
else
    yeven = 1;
end

for n = 2:2:xlen
    
    evenx = xvec(n);
    oddx = xvec(n-1);
    
    for m = 1:ylen
        
        cury = yvec(m);
        
        if (yeven&xeven)|(~yeven&~xeven) %even y's should produce even x's, odd y's produce odd x's
            if mod(m,2) == 1
                curx = oddx;
            else
                curx = evenx;
            end
        else %crossed up x's and y's
            if mod(m,2) == 1
                curx = evenx;
            else
                curx = oddx;
            end
        end
        
        outmat(cury,curx) = 1; %place ones at each vertex
        
    end
    
end

[yvec,xvec] = find(outmat); %return vertices in vector form as well

% figure
% imagesc(outmat)


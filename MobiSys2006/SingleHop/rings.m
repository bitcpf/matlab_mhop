%RINGS.M
%This function takes in a vector of x coordinates and a vector of y
%coordinates corresponding to circle centers and minimum and maximum radii indicating the
%size of the circles to be plotted. This is designed as a primitive overlay
%mapping tool.

function ringmat = rings(maxx,maxy,centerx,centery,rmin,rmax)

ringmat = zeros(maxy,maxx); %preallocate a matrix to hold the rings

L = length(centerx); %this is the number of rings to plot

dmin = 2*rmin; %diameter of the ring
r2min = rmin^2;

dmax = 2*rmax;
r2max = rmax^2;

littlemat = zeros(dmax); %make a small matrix in which to generate ring

for n = 1:dmax
    
    curx = n - rmax; %make the coordinate of the center of the ring the origin
    curx2 = curx^2;
    
    for m = 1:dmax
        
        cury = m - rmax; %make the coordinate of the center of the ring the origin
        cury2 = cury^2;
        
        sqrterm = curx2 + cury2;
        
%         if (sqrterm <= r2)&((mod(m+n,101)==0)|(mod(m-n,101)==0))
        if (sqrterm <= r2max)&(sqrterm >= r2min)&(mod(m,11)==0)&(mod(n,11)==0) %the last two terms thin out the shading

            littlemat(m,n) = 1; %place ones at all points within or on the edge of the ring
            
            %if we want to have different levels of coverage, then make the
            %value placed in each entry into a variable, and then run this
            %function several times, or-ing or adding matrices together to
            %make a contour map indicating coverage quality as well as area
        end
        
    end
    
end

for l = 1:L
    
    curx = centerx(l); %coordinates for center of current ring
    cury = centery(l);
    
    xleftout = (rmax-curx)*(rmax>curx); %this will be either zero or the amount by which the left side of the ring falls outside the range
    xrightout = (curx + rmax - maxx)*((curx+rmax)>maxx);%this is either zero or the amount by which the right side of the ring falls outside the range
    
    ybotout = (rmax-cury)*(rmax>cury); %bottom of frame offset
    ytopout = (cury + rmax - maxy)*((cury+rmax)>maxy); %top of frame offset
    
    xlo = 1 + curx - rmax + xleftout; %left limit of ring
    xhi = curx + rmax - xrightout; %right limit of ring
    ylo = 1 + cury - rmax + ybotout; %bottom limit of ring
    yhi = cury + rmax - ytopout; %top limit of ring
    
    tempmat = littlemat((1+ybotout):(dmax-ytopout),(1+xleftout):(dmax-xrightout)); %truncate to stay in ringmat
    
    ringmat(ylo:yhi,xlo:xhi) = ringmat(ylo:yhi,xlo:xhi)|(tempmat); %place the ring in the big matrix
    
    %if we want to indicate "better" coverage by overlap, then put addition
    %in the place of the logical or (|)
    
%     ringmat(ylo:yhi,xlo:xhi) = ringmat(ylo:yhi,xlo:xhi)+(tempmat); %place the ring in the big matrix
    
end

% figure
% imagesc(ringmat)

%Stationary node
statx = 1336;
staty = 1003;

[yvec,xvec] = find(ringmat);

map = imread('pecan_park_map.tif');
figure
hold on
image(map)
scatter(xvec,yvec,'b.')
axis equal
axis ij




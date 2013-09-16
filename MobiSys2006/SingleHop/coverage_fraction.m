%COVERAGE_FRACTION.M
%This function takes in a vector of x coordinates, a vector of y
%coordinates, a radius, and maximum x and y limits (assumes we're working
%in a rectangular area). It outputs the fraction of the total area that is
%covered by circles of the given radius at the given centers.

function frac = coverage_fraction(maxx,maxy,centerx,centery,r)

circlemat = zeros(maxy,maxx); %preallocate a matrix to hold the circles

L = length(centerx); %this is the number of circles to plot

d = 2*r; %diameter of the circle
r2 = r^2;

littlemat = zeros(d); %make a small matrix in which to generate circle

for n = 1:d
    
    curx = n - r; %make the coordinate of the center of the circle the origin
    curx2 = curx^2;
    
    for m = 1:d
        
        cury = m - r; %make the coordinate of the center of the circle the origin
        cury2 = cury^2;
        
        sqrterm = curx2 + cury2;
        
%         if (sqrterm <= r2)&((mod(m+n,101)==0)|(mod(m-n,101)==0))
%         if (sqrterm <= r2)&(mod(m,11)==0)&(mod(n,11)==0)
        if(sqrterm <= r2)

            littlemat(m,n) = 1; %place ones at all points within or on the edge of the circle
            
            %if we want to have different levels of coverage, then make the
            %value placed in each entry into a variable, and then run this
            %function several times, or-ing or adding matrices together to
            %make a contour map indicating coverage quality as well as area
        end
        
    end
    
end

for l = 1:L
    
    curx = centerx(l); %coordinates for center of current circle
    cury = centery(l);
    
    xleftout = (r-curx)*(r>curx); %this will be either zero or the amount by which the left side of the circle falls outside the range
    xrightout = (curx + r - maxx)*((curx+r)>maxx);%this is either zero or the amount by which the right side of the circle falls outside the range
    
    ybotout = (r-cury)*(r>cury); %bottom of frame offset
    ytopout = (cury + r - maxy)*((cury+r)>maxy); %top of frame offset
    
    xlo = 1 + curx - r + xleftout; %left limit of circle
    xhi = curx + r - xrightout; %right limit of circle
    ylo = 1 + cury - r + ybotout; %bottom limit of circle
    yhi = cury + r - ytopout; %top limit of circle
    
    tempmat = littlemat((1+ybotout):(d-ytopout),(1+xleftout):(d-xrightout)); %truncate to stay in circlemat
    
    circlemat(ylo:yhi,xlo:xhi) = circlemat(ylo:yhi,xlo:xhi)|(tempmat); %place the circle in the big matrix
    
    %if we want to indicate "better" coverage by overlap, then put addition
    %in the place of the logical or (|)
    
%     circlemat(ylo:yhi,xlo:xhi) = circlemat(ylo:yhi,xlo:xhi)+(tempmat); %place the circle in the big matrix
    
end

figure
imagesc(circlemat)
% contour(circlemat)

covered_area = sum(sum(circlemat));
total_area = maxx * maxy;

frac = covered_area/total_area;


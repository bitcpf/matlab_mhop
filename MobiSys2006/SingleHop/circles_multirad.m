%CIRCLES_MULTIRAD.M
%This function takes in a vector of x coordinates and a vector of y
%coordinates corresponding to circle centers and a vector of radii indicating the
%sizes of the circles to be plotted. This is designed as a primitive overlay
%mapping tool.

function circlemat = circles(maxx,maxy,centerx,centery,r)

circlemat = zeros(maxy,maxx); %preallocate a matrix to hold the circles

L = length(centerx); %this is the number of circles to plot
for l = 1:L

    curr = r(l);

    d = 2*curr; %diameter of the circle
    r2 = curr^2;

    littlemat = zeros(d); %make a small matrix in which to generate circle

    for n = 1:d

        curx = n - curr; %make the coordinate of the center of the circle the origin
        curx2 = curx^2;

        for m = 1:d

            cury = m - curr; %make the coordinate of the center of the circle the origin
            cury2 = cury^2;

            sqrterm = curx2 + cury2;

            if sqrterm <= r2
                littlemat(m,n) = 1; %place ones at all points within or on the edge of the circle

                %if we want to have different levels of coverage, then make the
                %value placed in each entry into a variable, and then run this
                %function several times, or-ing or adding matrices together to
                %make a contour map indicating coverage quality as well as area
            end

        end

    end



    curx = centerx(l); %coordinates for center of current circle
    cury = centery(l);

    xleftout = (curr-curx)*(curr>curx); %this will be either zero or the amount by which the left side of the circle falls outside the range
    xrightout = (curx + curr - maxx)*((curx+curr)>maxx);%this is either zero or the amount by which the right side of the circle falls outside the range

    ybotout = (curr-cury)*(curr>cury); %bottom of frame offset
    ytopout = (cury + curr - maxy)*((cury+curr)>maxy); %top of frame offset

    xlo = 1 + curx - curr + xleftout; %left limit of circle
    xhi = curx + curr - xrightout; %right limit of circle
    ylo = 1 + cury - curr + ybotout; %bottom limit of circle
    yhi = cury + curr - ytopout; %top limit of circle

    tempmat = littlemat((1+ybotout):(d-ytopout),(1+xleftout):(d-xrightout)); %truncate to stay in circlemat

%     circlemat(ylo:yhi,xlo:xhi) = circlemat(ylo:yhi,xlo:xhi)|(tempmat); %place the circle in the big matrix

    %if we want to indicate "better" coverage by overlap, then put addition
    %in the place of the logical or (|)

        circlemat(ylo:yhi,xlo:xhi) = circlemat(ylo:yhi,xlo:xhi)+(tempmat); %place the circle in the big matrix

end

figure
imagesc(circlemat)




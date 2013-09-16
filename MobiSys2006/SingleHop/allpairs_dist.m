%ALLPAIRS_DIST.M
%This function takes in two vectors representing the x and y coordinates of
%a list of points and outputs a matrix representing the distances between
%each pair of points.

function distmat = allpairs_dist(xvec,yvec)

L = length(xvec); %number of points to consider

distmat = zeros(L);

for n = 1:L
    
    xn = xvec(n);
    yn = yvec(n);
    
    for m = 1:L
        
        xm = xvec(m);
        ym = yvec(m);
        
        distmat(n,m) = sqrt((xn - xm)^2 + (yn - ym)^2);
        
    end
end

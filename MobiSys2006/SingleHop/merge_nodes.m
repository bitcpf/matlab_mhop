%MERGE_NODES.M
%This function takes in a vector of x coordinates and a vector of y
%coordinates and finds all nodes that are closer than the prescribed
%minimum distance. The function makes each such pair into a single node
%placed at the midpoint between the two original nodes.

function [xout,yout] = merge_nodes(xvec,yvec,r,forbidden_list)

L = length(xvec);

distmat = allpairs_dist(xvec,yvec) + 1e6*eye(L);

[nearest_dist,neighbor_index] = min(distmat); %find the distance to the nearest neighbor of each

% [too_near,too_near_index] = find(nearest_dist<r); %find all nearest pairs that are too close

% N = length(too_near);

% tempxvec = xvec;
% tempyvec = yvec;

xout = [];
yout = [];
mark = zeros(L,1);
mark(forbidden_list) = 1; %prevent special nodes (probably wired) from being moved

for n = 1:L
    
    dist = nearest_dist(n);
    index = neighbor_index(n);
    
    if (dist < r)&(mark(n)==0)
        
        tempx1 = xvec(n);
        tempy1 = yvec(n);
        
        tempx2 = xvec(index);
        tempy2 = yvec(index);
        
        mark(index) = 1; %mark the moved node so we don't move it again
        
        midx = round((tempx1 + tempx2)/2);
        midy = round((tempy1 + tempy2)/2);
        
        xout = [xout;midx];
        yout = [yout;midy];
        
    elseif (dist >= r)
        
        xout = [xout; xvec(n)];
        yout = [yout; yvec(n)];
        
    end
    
end
        
        
        
        
        
        
        
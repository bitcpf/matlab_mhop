%NUMBER_NEIGHBORS.M
%This function takes in a vector of x coordinates, a vector of y
%coordinates and a distance value. If the nodes are less than the given
%distance apart, then they are considered neighbors, so we count them

function neighborcount = number_neighbors(xvec,yvec,r)

L = length(xvec);

distmat = allpairs_dist(xvec,yvec) + 1e6*eye(L);

connectmat = (distmat <= r); %put ones at all indices where nodes are close enough

neighborcount = sum(connectmat); %each entry contains the number of neighbors
        
        
        
        
        
        
        
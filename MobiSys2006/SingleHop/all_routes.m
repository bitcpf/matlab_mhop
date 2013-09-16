%ALL_ROUTES.M
%This function takes in a connectivity matrix for a graph, a starting node
%index, an ending node index, and a number of hops. The output is all
%possible paths from the starting node to the ending node traversing the
%prescribed number of hops.

function route_list = all_routes(connectmat, startindex, endindex, hops)

startvec = connectmat(:,startindex); %vector of connections to starting node
endvec = connectmat(:,endindex); %vector of connections to ending node

for h = 1:hops
    
    
%FIND_LINE.M
%This function takes in the Cartesian coordinates of two points in a plane
%and returns a list of discrete points that lie on the line between the two
%endpoints.

function [cvec, rvec] = find_line(c1,r1,c2,r2)

cdif = (c1 - c2);
rdif = (r1 - r2);

if (rdif==0)&(cdif==0) %endpoints are the same
    rvec = r1;
    cvec = c1;
elseif abs(rdif)>abs(cdif) %make cvec a function of rvec
    if r1>r2
        rbegin = r2;
        cbegin = c2;
        rend = r1;
        cend = c1;
    else
        rbegin = r1;
        cbegin = c1;
        rend = r2;
        cend = c2;
    end
    rvec = rbegin:rend;
    slope = (cend - cbegin)/(rend - rbegin);
    cvec = round(slope * (rvec - rbegin) + cbegin); 
else%make rvec a function of cvec
    if c1>c2 %make the smaller column coordinate the beginning of the column vector
        cbegin = c2;
        rbegin = r2;
        cend = c1;
        rend = r1;
    else
        cbegin = c1;
        rbegin = r1;
        cend = c2;
        rend = r2;
    end
    cvec = cbegin:cend; %vector of column coordinates to consider
    slope = (rend - rbegin)/(cend - cbegin);
    rvec = round(slope * (cvec - cbegin) + rbegin);
end



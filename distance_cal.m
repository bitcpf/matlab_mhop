
function out=distance_cal(input)
[m,n]=size(input);
for i=1:m
distance(i)=gps_distance(input(i,1),input(i,2),input(i,3),input(i,4));
end
out=distance;
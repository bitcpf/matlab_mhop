%RXPOWER_VS_DIST.M
%This function takes in a distance and a pathloss exponent and outputs the
%theoretical received power value.

function rxpower = rxpower_vs_dist(dist,alpha)

d0 = 9.144; %reference distance 30' or 9.144 m
P0 = -2; %reference received signal power -2 dBm

rxpower = P0 - 10*alpha*log10(dist/d0); %theoretical received power value
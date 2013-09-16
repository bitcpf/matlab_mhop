%GPS2DIST.M
%This function takes in two GPS coordinates in the form that is output from
%Dr. Knightly's handheld GPS receiver, and it outputs the distance between
%the two points in meters. NOTE: this function can accept vectors of
%points. Also note that it assumes that the degrees are the same for all
%measurements, just input minutes.fractions of minutes.


function dist = gps2dist(N1,W1,N2,W2)

Nconst = 0.00054; %0.00054 minutes to one meter
Wconst = 0.00062; %0.00063 minutes to one meter

Ndiff = N1 - N2;
Wdiff = W1 - W2;

Ndist = Ndiff./Nconst;
Wdist = Wdiff./Wconst;

dist = sqrt(Ndist.^2 + Wdist.^2);
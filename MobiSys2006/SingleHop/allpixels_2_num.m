%ALLPIXELS_2_NUM.M
%This function takes in a matrix of rgb values (NxMx3 matrix) and returns a
%matrix of numbers representing color values.
%yellow = 1
%orange = 2
%magenta = 3
%purple = 4
%blue = 5
%green = 6
%red = 7
%other = 0

function nummat = allpixels_2_num(tifmat)

rlayer = tifmat(:,:,1);
glayer = tifmat(:,:,2);
blayer = tifmat(:,:,3);

nummat = rgb_2_num(rlayer,glayer,blayer);
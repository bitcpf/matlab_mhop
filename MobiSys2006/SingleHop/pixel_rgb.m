%PIXEL_RGB.M
%This function takes in the Cartesian coordinates of a single pixel in a
%TIFF (.tif) image with RGB color encoding, and it returns the three
%numbers representing the color of that pixel.

function [r,g,b] = pixel_rgb(x,y,matrix)

vec = matrix(x,y,:);
r = vec(1);
g = vec(2);
b = vec(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COLORS IN PECAN_PARK_MAP.TIF              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%black   = 0   0   0                       %
%yellow  = 255 255 0                       %
%orange  = 255 173 0                       %
%red     = 255 0   0                       %
%magenta = 254 0   161                     %
%purple  = 193 0   254                     %
%blue    = 0   130 255                     %
%green   = 1   130 0                       %
%gray    = 165 165 165                     % 
%white   = 255 255 255                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


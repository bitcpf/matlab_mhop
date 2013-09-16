%RGB_2_COLOR.M
%This function takes in red, green, and blue (rgb) values and converts them
%to the equivalent color from the Pecan Park map color key. The color is
%described by a single letter abbreviation:
%yellow = y
%orange = o
%magenta = m
%purple = p
%blue = b
%green = g
%other = x
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

function color = rgb_2_color(r,g,b)

if (r==255)&(g==255)&(b==0)
    color = 'y';
elseif (r==255)&(g==173)&(b==0)
    color = 'o';
elseif (r==255)&(g==0)&(b==0)
    color = 'r';
elseif (r==254)&(g==0)&(b==161)
    color = 'm';
elseif (r==193)&(g==0)&(b==254)
    color = 'p';
elseif (r==0)&(g==130)&(b==255)
    color = 'b';
elseif (r==1)&(g==130)&(b==0)
    color = 'g';
else
    color = 'x';
end

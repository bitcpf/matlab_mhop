%RGB_2_NUM.M
%This function takes in red, green, and blue (rgb) values and converts them
%to a number assigned to the equivalent color from the Pecan Park map color key. The color is
%described by a single digit:
%yellow = 1 = single family residential
%orange = 2 = multi family residential
%magenta = 3 = office
%purple = 4 = industrial
%blue = 5 = public and institutional
%green = 6 = open space
%red = 7 = commercial
%other = 0 = undeveloped, roads, etc.
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

function color = rgb_2_num(r,g,b)

% if (r==255)&(g==255)&(b==0)
%     color = 1;
% elseif (r==255)&(g==173)&(b==0)
%     color = 2;
% elseif (r==254)&(g==0)&(b==161)
%     color = 3;
% elseif (r==193)&(g==0)&(b==254)
%     color = 4;
% elseif (r==0)&(g==130)&(b==255)
%     color = 5;
% elseif (r==1)&(g==130)&(b==0)
%     color = 6;
% elseif (r==255)&(g==0)&(b==0)
%     color = 7; %red
% else
%     color = 0;
% end

color = zeros(size(r));

yindex = find((r==255)&(g==255)&(b==0));
oindex = find((r==255)&(g==173)&(b==0));
mindex = find((r==254)&(g==0)&(b==161));
pindex = find((r==193)&(g==0)&(b==254));
bindex = find((r==0)&(g==130)&(b==255));
gindex = find((r==1)&(g==130)&(b==0));
rindex = find((r==255)&(g==0)&(b==0));

color(yindex) = 1;
color(oindex) = 2;
color(mindex) = 3;
color(pindex) = 4;
color(bindex) = 5;
color(gindex) = 6;
color(rindex) = 7;

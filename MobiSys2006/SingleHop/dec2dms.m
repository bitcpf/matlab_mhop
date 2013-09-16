%DEC2DMS.M
%This function takes in a decimal GPS coordinate (degrees.fractions of
%degrees) and changes it into degree minute second notation.

function [d,m,s] = dec2dms(dec)

d = floor(dec); %degrees

dec2 = (dec - d)*60; %minutes with a decimal indicating seconds

m = floor(dec2); %minutes

s = (dec2 - m)*60; %seconds
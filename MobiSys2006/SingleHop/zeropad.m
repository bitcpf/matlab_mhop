%ZEROPAD.M
%This function takes in a vector and a desired length, and it outputs the
%vector padded with zeros to the desired length;

function outvec = zeropad(vec,len)

[vecrows,veccols] = size(vec); %need to know whether input is row or column

[L,dim] = max([vecrows,veccols]); %if dim = 2 then row vector

if (dim == 2)&(len>L)
    pad = zeros(1,len-L);
    outvec = [vec,pad];
elseif (dim == 1)&(len>L)
    pad = zeros(len-L,1);
    outvec = [vec;pad];
else
    outvec = vec;
end


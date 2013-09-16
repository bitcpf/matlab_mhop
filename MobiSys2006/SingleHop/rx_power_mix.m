%RX_POWER_MIX.M
%This function calculates received signal power after the signal has passed
%through a variety of terrain with possibly different pathloss exponents.
%Pt = transmitted power
%Gt = gain of the transmitting antenna
%Gr = gain of the receiving antenna
%lambda = wavelength of the transmitted signal
%histvec = vector containing a histogram of number of each type of pixel
%(each type of environment)
%alphavec = vector of pathloss exponents associated with each environment
%type
%L = system loss not related to propagation (L>=1)
%meters_per_pixel = meters per pixel (tells the scale of the map)
%and it outputs Pr, the signal power at the receiver

% function Pr = rx_power(Pt,Gt,Gr,lambda,d,alpha,L)
function Prtotal = rx_power_mix(histvec,alphavec,Pt,Gt,Gr,lambda,L,meters_per_pixel)

N = length(histvec); %number of different environments to consider
%the length of the alphavec should also be N

powersteps = zeros(1,N); %preallocate vector to hold intermediate received power values

for n = 1:N
    
    d = histvec(n) * meters_per_pixel; %actual distance through current environment (meters)
    alpha = alphavec(n); %current pathloss exponent
    
    if n==1
        gt = Gt; %only account for the tx antenna gain at the first step
        pt = Pt; %use the original transmitted power
        l = L; %only account for other system losses on the first step
    else
        gt = 1;
        pt = powersteps(n-1); %otherwise, use the last known received power as the tx power
        l = 1;
    end
    
    if n==N
        gr = Gr; %only account for the rx antenna gain at the last step
    else
        gr = 1;
    end
    
    if d==0 %if there is no propagation through the current environment
        powersteps(n) = pt;
    else
        powersteps(n) = rx_power(pt,gt,gr,lambda,d,alpha,l);
    end
end

Prtotal = powersteps(N);
    
    
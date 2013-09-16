%pathloss_work_5_18_05.m

%the signal power measurement comes from putting a 15 dBi antenna at 40'
%elevation 30' away from the identical TFA antenna, also at 40'.

c = 3e8; %speed of light
f = 2.4e9; %carrier frequency
lambda = c/f; %wavelength

Grdb = 15; %15 dBi antenna
Gtdb = 15;
Gr = 10^(Grdb/10);
Gt = 10^(Gtdb/10);

d0 = 9.144; %reference distance in meters

Pt = 200; %transmit power in mW
Prdb = -2-25; %received power in dBm
Pr = 10^(Prdb/10); %received power in mW

num = Pt * Gt * Gr * (lambda^2);
denom = ((4*pi)^2) * (d0^2) * Pr;

L = num/denom

Ldb = 10*log10(L);

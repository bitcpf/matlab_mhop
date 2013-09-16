%FINDL.M
%The purpose of this script is to find the system loss associated with our
%reference measurement.

Gtdb = 15;
Grdb = 15;

Pt = 200; % 200 mW received power, see if it works better with 0.2 W...
Prdb = -32; % -2 dBm? received power
Pr = 10^(Prdb/10); %received power in mW?

d = 9.144; %reference distance

lambda = 0.125; %wavelength at 2.4 GHz

alpha = 2; %assume freespace pathloss

Gt = 10.^(Gtdb/10);
Gr = 10.^(Grdb/10);

% Pt = 10.^(Ptdb/10);
% Pr = 10.^(Prdb/10);

% Pr = (Gt*Gr*lambda^2*Pt)/((4*pi)^2*(d^alpha)*L;

L = (Gt*Gr*(lambda^2)*Pt)/(((4*pi)^2)*(d^alpha)*Pr)

%PLEXP.M
%This function calculates pathloss exponents given transmitted and received
%signal power information.

function alpha = plexp(d,L,Gtdb,Grdb,Ptdb,Prdb,lambda)

Gt = 10.^(Gtdb/10);
Gr = 10.^(Grdb/10);

Pt = 10.^(Ptdb/10);
Pr = 10.^(Prdb/10);

% Pr = (Gt*Gr*lambda^2*Pt)/((4*pi)^2*(d^alpha)*L;

num = Gt*Gr*(lambda^2)*Pt;
denom = ((4*pi)^2)*L*Pr;
alpha = log(num./denom)./log(d);
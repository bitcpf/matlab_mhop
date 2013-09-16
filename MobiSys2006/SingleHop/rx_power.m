%RX_POWER.M
%This function takes in the following variables
%Pt = transmitted power
%Gt = gain of the transmitting antenna
%Gr = gain of the receiving antenna
%lambda = wavelength of the transmitted signal
%d = separation in meters between tx and rx
%alpha = pathloss exponent
%L = system loss not related to propagation (L>=1)
%and it outputs Pr, the signal power at the receiver

function Pr = rx_power(Pt,Gt,Gr,lambda,d,alpha,L)

numerator = Pt * Gt * Gr * (lambda^2);
denominator = ((4*pi)^2) * (d^alpha) * L;

Pr = numerator/denominator;
%GET_PLEXP.M
%This function takes in a vector of distances and a vector of received
%signal powers, and it outputs a vector of pathloss exponent values.

function alpha = get_plexp(distvec,sigvec,d0,P0)

% d0 = 9.144; %reference distance 30' or 9.144 m
% P0 = -32; %reference received signal power -2 dBm

%NOTE THAT WE ARE ASSUMING THAT ALL VALUES FROM SIGSPY ARE 30 DB TOO HIGH,
%SO WE SUBTRACT 30 FROM ALL NUMBERS

% d0 = 10;
% P0 = -9;

alpha = (P0 - (sigvec(:) - 0))./(10.*log10(distvec(:)./d0));
%MEASUREMENT_RESULTS_3_21_05
%Baseball to baseball ~25 feet on both sides, with rate limiting, TCP

function [sig, tcp, dist] = measurement_results_3_21_05(dummy)


dist = [12.16; 
    95.17; 
    150.42; 
    228.20;  
    238.60; 
    303.18; 
    323.51; 
    231.58; 
    156.55; 
    256.24];

sig = zeros(10,1);
tcp = zeros(10,1);

%Location1
N(1) = 42.344; % GPS latitude minutes, degrees are all 29
W(1) = 16.986; % GPS longitude minutes, degrees are all 95
sig(1) = -6; %signal power in dBm
tcp(1) = 240*8; %tcp throughput in kbps

%Location 2
N(2) = 42.388; % GPS latitude minutes, degrees are all 29
W(2) = 17.016; % GPS longitude minutes, degrees are all 95
sig(2) = -13;
tcp(2) = 200*8;

%Location 3
N(3) = 42.390; % GPS latitude minutes, degrees are all 29
W(3) = 17.018; % GPS longitude minutes, degrees are all 95
sig(3) = -11;
tcp(3) = 238*8;

%Location 4
%THESE ARE ACTUALLY THE GPS COORDINATES FROM LOCATION 5!!!
N(4) = 42.224;
W(4) = 16.930;
sig(4) = -18;
tcp(4) = 40*8;

%Location 5
N(5) = 42.224;
W(5) = 16.930;
sig(5) = -23;
tcp(5) = 12*8;

%Location 6
N(6) = 42.215;
W(6) = 16.872;
sig(6) = -13;
tcp(6) = 190*8;

%Location 7
N(7) = 42.304;
W(7) = 16.796;
sig(7) = -27;
tcp(7) = 0; 

%Location 8
N(8) = 42.307;
W(8) = 16.854;
sig(8) = -15;
tcp(8) = 0; %unable to establish a connection for speeddaemon, could have been software issue

%Location 9
N(9) = 42.425
W(9) = 16.984;
sig(9) = -13;
tcp(9) = 230*8;

%Location 10
N(10) = 42.427;
W(10) = 16.868;
sig(10) = -18;
tcp(10) = 220*8;

%convert to dms GPS notation
% Ndeg = 29*ones(10,1);
% Wdeg = 95*ones(10,1);
% Nmin = floor(N);%get integer minutes
% Wmin = floor(W);
% Nsec = 60*(N-Nmin); %convert the decimal minutes to seconds
% Wsec = 60*(W-Wmin);
% Nmat = [Ndeg, Nmin', Nsec'];
% Wmat = [Wdeg, Wmin', Wsec'];



%Analysis and visualization section
% siglin = 10.^(sig./10);
% minx = min(x);
% maxx = max(x);
% miny = min(y);
% maxy = max(y);


% pixeldist = zeros(length(x));
% targetdist = zeros(length(x),1);
% for n = 1:length(x)
%     xn = x(n);
%     yn = y(n);
%     targetdist(n) = sqrt((xn-statx)^2 + (yn-staty)^2); %pixel distance to stationary antenna
%     for m = 1:length(x)
%         xm = x(m);
%         ym = y(m);
%         pixeldist(n,m) = sqrt((xn-xm)^2 + (yn-ym)^2); %pixel distance from each measurement point to all others
%     end
% end

% figure
% hold on
% image(map)
% scatter(x,y,50,'r')
% scatter(statx,staty,50,'k')
% xlim([min(x)-100 max(x)+100])
% ylim([min(y)-100 max(y)+100])
% axis ij

% figure
% hold on
% % image(map)
% flatmap = flatmap > 0; %make it binary
% % mapseg = flatmap(minx:maxx,miny:maxy);%only look at a segment of one color
% mapseg = flatmap(miny:maxy,minx:maxx,:);
% % image(mapseg)
% % contour(flatmap)
% % mesh(flatmap./10)
% % contour(flatmap)
% % contour(mapseg)
% % stem3(x,y,siglin,'filled')
% % image(map)
% % xlim([min(x) max(x)])
% % ylim([min(y) max(y)])
% % zlim([0 max(siglin)])
% % stem3(x-minx,y-miny,siglin,'filled','b')
% stem3(statx-minx,staty-miny,max(siglin),'filled','r')
% stem3(x-minx,y-miny,tcp,'filled','g')
% axis ij
% title('Received Signal Power Plot')


%MEASUREMENTS_4_8_05
%On 3-21 we had some kind of rate limiting in place.
%On 3-25 we removed the rate limiting
%On 3-28 we used "light sabre" antennas at both sides, elevated to ~35' at
%Ben's house
%On 4-8 we used a baseball bat at Ben's house and on the mobile unit, and
%we added additional measurement locations, all throughput measurements
%were udp
%The measurement locations should be approximately the same, but we took
%separate GPS readings

% map = imread('pecan_park_map.tif');
% flatmap = allpixels_2_num(map); %make the map two dimensional instead of rgb

clear all

%March 21 measurements
sig1 = zeros(10,1);
sigvar1 = zeros(10,1); %plus/minus range about mean signal power
tcp1 = zeros(10,1);
tcpvar1 = zeros(10,1); %plus/minus range about mean throughput
% dist1 = zeros(10,1);

%March 25 measurements
sig2 = zeros(11,1);
sigvar2 = zeros(11,1);
tcp2 = zeros(11,1);
tcpvar2 = zeros(11,1);
% dist2 = zeros(11,1);

%March 28 measurements
sig3 = zeros(11,1);
sigvar3 = zeros(11,1);
tcp3 = zeros(11,1);
tcpvar3 = zeros(11,1);
% dist3 = zeros(11,1);

%April 8 Measurements
sig4 = zeros(19,1);
sigvar4 = zeros(19,1);
udp4 = zeros(19,1);
udpvar4 = zeros(19,1);
% dist4 = zeros(19,1);

%Stationary node
% statx = 1336;
% staty = 1003;
statN = [29 42 20.448];
statW = [95 16 59.556];

%Location 1
N(1) = 42.344; % GPS latitude minutes, degrees are all 29
W(1) = 16.986; % GPS longitude minutes, degrees are all 95
%3-21-05
sig1(1) = -12; %signal power in dBm
sigvar1(1) = 6;  
tcp1(1) = 240*8; %tcp throughput in kbps
tcpvar1(1) = 2*8;
%3-25-05
sig2(1) = -9; %signal power in dBm
sigvar2(1) = 4;
tcp2(1) = 441*8; %tcp throughput in kbps
tcpvar2(1) = 0*8;
%3-28-05
sig3(1) = -11; %signal power in dBm
sigvar3(1) = 2;
tcp3(1) = 320*8; %tcp throughput in kbps
tcpvar3(1) = 20*8;
%4-8-05
sig4(1) = -5;
sigvar4(1) = 1;
udp4(1) = 545*8;
udpvar4(1) = 1*8;

%Location 2
N(2) = 42.388; % GPS latitude minutes, degrees are all 29
W(2) = 17.016; % GPS longitude minutes, degrees are all 95
%3-21-05
sig1(2) = -16;
sigvar1(2) = 1;
tcp1(2) = 200*8;
tcpvar1(2) = 0*8;
%3-25-05
sig2(2) = -20;
sigvar2(2) = 2;
tcp2(2) = 250*8;
tcpvar2(2) = 20*8;
%3-28-05
sig3(2) = -13;
sigvar3(2) = 1;
tcp3(2) = 410*8;
tcpvar3(2) = 10*8;
%4-8-05
sig4(2) = -12;
sigvar4(2) = 1;
udp4(2) = 400*8;
udpvar4(2) = 50*8;


%Location 3
N(3) = 42.261; % GPS latitude minutes, degrees are all 29
W(3) = 17.010; % GPS longitude minutes, degrees are all 95
%3-21-05
sig1(3) = -11;
sigvar1(3) = 0;
tcp1(3) = 238*8;
tcpvar1(3) = 0*8;
%3-25-05
sig2(3) = -11;
sigvar2(3) = 1;
tcp2(3) = 400*8;
tcpvar2(3) = 10*8;
%3-28-05
sig3(3) = -8.5;
sigvar3(3) = 0.5;
tcp3(3) = 440*8;
tcpvar3(3) = 0*8;
%4-8-05
sig4(3) = -12;
sigvar4(3) = 1;
udp4(3) = 530*8;
udpvar4(3) = 5*8;

%Location 4a
N(4) = 42.223;
W(4) = 16.951;
%3-21-05
sig1(4) = -20;
sigvar1(4) = 2;
tcp1(4) = 35*8;
tcpvar1(4) = 5*8;
%3-25-05
sig2(4) = -11;
sigvar2(4) = 1;
tcp2(4) = 370*8;
tcpvar2(4) = 10*8;
%3-28-05
sig3(4) = -10;
sigvar3(4) = 1;
tcp3(4) = 380*8;
tcpvar3(4) = 10*8;
%4-8-05
sig4(4) = -10;
sigvar4(4) = 1;
udp4(4) = 500*8;
udpvar4(4) = 5*8;

%Location 4b
N(5) = 42.219;
W(5) = 16.948;
%3-25-05
sig2(5) = -15;
sigvar2(5) = 2;
tcp2(5) = 320*8;
tcpvar2(5) = 20*8;
%3-28-05
sig3(5) = -21;
sigvar3(5) = 2;
tcp3(5) = 280*8;
tcpvar3(5) = 20*8;
%4-8-05
sig4(5) = -17;
sigvar4(5) = 2;
udp4(5) = 400*8;
udpvar4(5) = 5*8;

%Location 5
N(6) = 42.224;
W(6) = 16.930;
%3-21-05
sig1(5) = -24.5;
sigvar1(5) = 1.5;
tcp1(5) = 12*8;
tcpvar1(5) = 0;
%3-25-05
sig2(6) = -24;
sigvar2(6) = 3;
tcp2(6) = 100*8;
tcpvar2(6) = 80*8;
%3-28-05
sig3(6) = -26;
sigvar3(6) = 1;
tcp3(6) = 0*8;
tcpvar3(6) = 0*8;
%4-8-05
sig4(6) = -25;
sigvar4(6) = 1;
udp4(6) = 100*8;
udpvar4(6) = 50*8;

%Location 6
N(7) = 42.215;
W(7) = 16.872;
%3-21-05
sig1(6) = -14.5;
sigvar1(6) = 1.5;
tcp1(6) = 190*8;
tcpvar1(6) = 0*8;
%3-25-05
sig2(7) = -16;
sigvar2(7) = 1;
tcp2(7) = 320*8;
tcpvar2(7) = 20*8;
%3-28-05
sig3(7) = -12;
sigvar3(7) = 1;
tcp3(7) = 390*8;
tcpvar3(7) = 10*8;
%4-8-05
sig4(7) = -18;
sigvar4(7) = 1;
udp4(7) = 400*8;
udpvar4(7) = 10*8;

%Location 7
N(8) = 42.304;
W(8) = 16.796;
%3-21-05
sig1(7) = -27;
sigvar1(7) = 0;
tcp1(7) = 0; 
tcpvar1(7) = 0;
%3-25-05
sig2(8) = -26;
sigvar2(8) = 1;
tcp2(8) = 35*8;
tcpvar2(8) = 15*8;
%3-28-05
sig3(8) = -27;
sigvar3(8) = 1;
tcp3(8) = 45*8;
tcpvar3(8) = 10*8;
%4-8-05
sig4(8) = -26;
sigvar4(8) = 1;
udp4(8) = 0*8;
udpvar4(8) = 0*8;

%Location 8
N(9) = 42.307;
W(9) = 16.854;
%3-21-05
sig1(8) = -16.5;
sigvar1(8) = 1.5;
tcp1(8) = 0; %unable to establish a connection for speeddaemon, could have been software issue
tcpvar1(8) = 0;
%3-25-05
sig2(9) = -22;
sigvar2(9) = 2;
tcp2(9) = 110*8;
tcpvar2(9) = 30*8;
%3-28-05
sig3(9) = -24;
sigvar3(9) = 2;
tcp3(9) = 100*8;
tcpvar3(9) = 30*8;
%4-8-05
sig4(9) = -25;
sigvar4(9) = 0;
udp4(9) = 0;
udpvar4(9) = 0;

%Location 9
N(10) = 42.425;
W(10) = 16.984;
%3-21-05
sig1(9) = -13;
sigvar1(9) = 0;
tcp1(9) = 230*8;
tcpvar1(9) = 0*8;
%3-25-05
sig2(10) = -13;
sigvar2(10) = 1;
tcp2(10) = 380*8;
tcpvar2(10) = 10*8;
%3-28-05
sig3(10) = -22;
sigvar3(10) = 2;
tcp3(10) = 320*8;
tcpvar3(10) = 20*8;
%4-8-05
sig4(10) = -16.5;
sigvar4(10) = 1.5;
udp4(10) = 480*8;
udpvar4(10) = 40*8;

%Location 10
N(11) = 42.427;
W(11) = 16.868;
%3-21-05
sig1(10) = -19;
sigvar1(10) = 1;
tcp1(10) = 220*8;
tcpvar1(10) = 0*8;
%3-25-05
sig2(11) = -19;
sigvar2(11) = 2;
tcp2(11) = 280*8;
tcpvar2(11) = 20*8;
%3-28-05
sig3(11) = -24;
sigvar3(11) = 2;
tcp3(11) = 0*8;
tcpvar3(11) = 0*8;
%4-8-05
sig4(11) = -20.5;
sigvar4(11) = 1.5;
udp4(11) = 50*8;
udpvar4(11) = 10*8;

%Location 11
N(12) = 42.389; 
W(12) = 16.881; 
%4-8-05
sig4(12) = -20.5;
sigvar4(12) = 1.5;
udp4(12) = 100*8;
udpvar4(12) = 20*8;

%Location 12
N(13) = 42.388;
W(13) = 16.960;
%4-8-05
sig4(13) = -15;
sigvar4(13) = 2;
udp4(13) = 475*8;
udpvar4(13) = 10*8;

%Location 13
N(14) = 42.292;
W(14) = 16.929;
%4-8-05
sig4(14) = -9;
sigvar4(14) = 1;
udp4(14) = 530*8;
udpvar4(14) = 5*8;

%Location 14
N(15) = 42.266;
W(15) = 16.875;
%4-8-05
sig4(15) = -11.5;
sigvar4(15) = 0.5;
udp4(15) = 520*8;
udpvar4(15) = 10*8;

%Location 15
N(16) = 42.261;
W(16) = 16.954;
%4-8-05
sig4(16) = -10;
sigvar4(16) = 1;
udp4(16) = 520*8;
udpvar4(16) = 10*8;

%Location 16
N(17) = 42.345;
W(17) = 16.871;
%4-8-05
sig4(17) = -13;
sigvar4(17) = 2;
udp4(17) = 450*8;
udpvar4(17) = 10*8;

%Location 17
N(18) = 42.465;
W(18) = 16.987;
%4-8-05
sig4(18) = -27;
sigvar4(18) = 0;
udp4(18) = 0*8;
udpvar4(18) = 0*8;

%Location 18
N(19) = 42.463;
W(19) = 16.921;
%4-8-05
sig4(19) = -27;
sigvar4(19) = 0;
udp4(19) = 0;
udpvar4(19) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GET VECTORS INDIVIDUALLY %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

udp4(:)

udpvar4(:)
% tcpvar3(:)



%convert to dms GPS notation
%3-21-05
Ndeg = 29*ones(size(N));
Wdeg = 95*ones(size(W));
Nmin = floor(N);%get integer minutes
Wmin = floor(W);
Nsec = 60*(N-Nmin); %convert the decimal minutes to seconds
Wsec = 60*(W-Wmin);
Nmat = [Ndeg(:), Nmin(:), Nsec(:)];
Wmat = [Wdeg(:), Wmin(:), Wsec(:)];

%Vector of distances between points, in meters
distvec = [12.16; 
    95.17; 
    150.42; 
    228.20; 
    236.71; 
    238.60; 
    303.18; 
    323.51; 
    231.58; 
    156.55; 
    256.24; 
    200.49; 
    101.94; 
    136.51; 
    234.47; 
    160.30; 
    195.76; 
    230.19; 
    253.94];
distvec1 = [distvec(1:4); distvec(6:11)]; %skip location 4b
distvec2 = distvec(1:11); %11 locations
distvec3 = distvec(1:11); %11 locations
distvec4 = distvec(1:19); %19 locations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis and visualization section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%3-21-05
sigmat1 = [(sig1 - sigvar1) sig1 (sig1 + sigvar1)];
siglin1 = 10.^(sig1./10);
sigmatlin1 = 10.^(sigmat1./10);
tcpmat1 = [(tcp1 - tcpvar1) tcp1 (tcp1 + tcpvar1)];
distmat1 = [distvec1 distvec1 distvec1];
%3-25-05
sigmat2 = [(sig2 - sigvar2) sig2 (sig2 + sigvar2)];
siglin2 = 10.^(sig2./10);
sigmatlin2 = 10.^(sigmat2./10);
tcpmat2 = [(tcp2 - tcpvar2) tcp2 (tcp2 + tcpvar2)];
distmat2 = [distvec2 distvec2 distvec2];
%3-28-05
sigmat3 = [(sig3 - sigvar3) sig3 (sig3 + sigvar3)];
siglin3 = 10.^(sig3./10);
sigmatlin3 = 10.^(sigmat3./10);
tcpmat3 = [(tcp3 - tcpvar3) tcp3 (tcp3 + tcpvar3)];
distmat3 = [distvec3 distvec3 distvec3];
%4-8-05
sigmat4 = [(sig4 - sigvar4) sig4 (sig4 + sigvar4)];
siglin4 = 10.^(sig4./10);
sigmatlin4 = 10.^(sigmat4./10);
udpmat4 = [(udp4 - udpvar4) udp4 (udp4 + udpvar4)];
distmat4 = [distvec4 distvec4 distvec4];
%4-21-05
[sig5,sigvar5,udp5,udpvar5,distvec5] = measurement_results_4_21_05(0);
sigmat5 = [(sig5 - sigvar5) sig5 (sig5 + sigvar5)];
siglin5 = 10.^(sig5./10);
sigmatlin5 = 10.^(sigmat5./10);
udpmat5 = [(udp5 - udpvar5) udp5 (udp5 + udpvar5)];
distmat5 = [distvec5 distvec5 distvec5];

%Histogram section
%We only do analysis of received signal power, not throughput, with
%histograms

%Baseball Bat Antennas at 25 ft
bb_distvec = [distvec1; distvec2; distvec4];
bb_sigvec = [sig1; sig2; sig4];
bb_distmat = [distmat1; distmat2; distmat4];
bb_sigmat = [sigmat1; sigmat2; sigmat4];
bb_indices_225_250 = find((bb_distvec>=225)&(bb_distvec<250));
bb_indices_250_plus = find((bb_distvec>=250));
bb_indices_225_275 = find((bb_distmat>=225)&(bb_distmat<275));
bb_sig_225_250 = bb_sigmat(bb_indices_225_250);
bb_sig_250_plus = bb_sigmat(bb_indices_250_plus);
bb_sig_225_275 = bb_sigmat(bb_indices_225_275);

if 0

figure
subplot(2,1,1)
hist(bb_sig_225_275)
xlabel('Signal Power (dBm)')
ylabel('Number of Measurements')
title('Baseball Bat Antennas 225-275 meters')
% figure
% subplot(1,2,1)
% hist(bb_sig_225_250,5)
% xlabel('Signal Power (dBm)')
% title('Baseball Bat Antennas 225-250 meters')
% subplot(1,2,2)
% hist(bb_sig_250_plus,5)
% xlabel('Signal Power (dBm)')
% title('Baseball Bat Antennas 250+ meters')

%Light Saber Antennas at different heights
ls_distvec = [distvec3; distvec5];
ls_distmat = [distmat3; distmat5];
ls_sigvec = [sig3; sig5];
ls_sigmat = [sigmat3; sigmat5];
ls_indices_200_250 = find((ls_distmat>=200)&(ls_distmat<250));
ls_indices_250_plus = find((ls_distvec>=250));
ls_indices_225_275 = find((ls_distmat>=225)&(ls_distmat<275));
ls_sig_200_250 = ls_sigmat(ls_indices_200_250);
ls_sig_250_plus = ls_sigmat(ls_indices_250_plus);
ls_sig_225_275 = ls_sigmat(ls_indices_225_275);
% figure
% hist(ls_sig_200_250)
% xlabel('Signal Power (dBm)')
% ylabel('Number of Measurements')
% title('Light Saber Antennas 200-250 meters')
% figure
subplot(2,1,2)
hist(ls_sig_225_275)
xlabel('Signal Power (dBm)')
ylabel('Number of Measurements')
title('Light Saber Antennas 225-275 meters')
% figure
% subplot(1,2,1)
% hist(ls_sig_225_250,5)
% xlabel('Signal Power (dBm)')
% title('Light Saber Antennas 225-250 meters')
% subplot(1,2,2)
% hist(ls_sig_250_plus,5)
% xlabel('Signal Power (dBm)')
% title('Light Saber Antennas 250+ meters')
print -depsc hist_rxpower_225_275

figure 
subplot(2,1,1)
hist(bb_distmat(:),25)
title('BB distances')
% figure
% hold on
subplot(2,1,2)
hist(ls_distmat(:),25,'r')
title('LS distances')
print -depsc hist_meas_dist

end

%Stem and Scatter Plot Section

%TCP Throughput

% tcp = [tcp1; tcp2; tcp3];
tcp = [tcpmat1; tcpmat2; tcpmat3];

tcp_bb = [tcpmat1; tcpmat2];
tcp_bb_dist = [distmat1; distmat2];

tcp_ls = tcpmat3;
tcp_ls_dist = distmat3;

% udp = udp4;
udp = [udpmat4; udpmat5];

udp_bb = udpmat4;
udp_bb_dist = distmat4;

udp_ls = udpmat5;
udp_ls_dist = distmat5;

tcpsigmat = [sigmat1; sigmat2; sigmat3];
udpsigmat = [sigmat4; sigmat5];

tcpdist = [distvec1; distvec2; distvec3];
tcpdistmat = [tcpdist, tcpdist, tcpdist];

udpdist = [distvec4; distvec5];
udpdistmat = [udpdist, udpdist, udpdist];

if 0

figure
hold on
% stem([siglin1; siglin2; siglin3],tcp,'k')
scatter(tcpsigmat(:),tcp(:),'k','filled')
scatter(udpsigmat(:),udp(:),'g','filled')
line([-20 -20],[0 6000])
line([-30 0],[1000 1000])
legend('TCP','UDP')
xlabel('Signal Strength (dBm)')
ylabel('Throughput (kb/s)')
title('Throughput vs. Signal Strength')
print -depsc throughput_vs_signal

figure
hold on
% stem([distvec1; distvec2; distvec3],tcp,'k')
scatter(tcp_bb_dist(:), tcp_bb(:),'k','filled')
scatter(tcp_ls_dist(:), tcp_ls(:),'b','filled')
% stem(distvec4,udp,'g')
scatter(udp_bb_dist(:),udp_bb(:),'g','filled')
scatter(udp_ls_dist(:),udp_ls(:),'c','filled')
legend('TCP, Baseball Bat','TCP, Light Saber','UDP, Baseball Bat','UDP, Light Saber')
xlabel('Distance (m)')
ylabel('Throughput (kb/s)')
line([0 350],[1000 1000])
title('Throughput vs. Distance (includes rate limiting measurements)')
print -depsc throughput_vs_dist

figure
hold on
scatter(bb_distmat(:),bb_sigmat(:),'r','filled')
scatter(ls_distmat(:),ls_sigmat(:),'b','filled')
line([0 350],[-20 -20])
legend('Baseball Bat','Light Saber')
xlabel('Distance (m)')
ylabel('Signal Strength (dBm)')
title('Signal Strength vs. Distance')
print -depsc signal_vs_dist

end

% figure
% hold on
% stem(distvec,siglin,'k')
% stem(distvec,siglin2,'k')
% stem(distvec,siglin3,'g')
% legend('March 21','March 25','March 28')
% xlabel('Distance (m)')
% ylabel('Signal Strength (mW)')
% interceptlow = 2.5;
% interceptmid = 2.5;
% intercepthigh = 1;
% alphalow = 1.2;
% alphamid = 1.1;
% alphahigh = 0.5;
% sortdist = min(distvec):max(distvec);
% colorvec = ['b','g','r','c','m','y','k'];
% lowbound = interceptlow * (sortdist.^(-alphalow));
% upbound = intercepthigh * (sortdist.^(-alphahigh));
% midbound = interceptmid * (sortdist.^(-alphamid));
% 
% plot(sortdist,lowbound,'b')
% plot(sortdist,upbound,'r')
% plot(sortdist,midbound,'g')
% sortdist = sort(distvec);
% for n = 0:length(alphavec)-1
%     alpha = alphavec(n+1);
%     expline = (sortdist.^(-alpha))*intercept;
%     plot(sortdist,expline,colorvec(n+1));
% end

% legend('Measurement Data','PL exp = 1.0','PL exp = 1.1','PL exp = 1.2','PL exp = 1.3','PL exp = 1.4','PL exp = 1.5');



% figure
% hold on
% stem(distvec,tcp,'r')
% stem(distvec,tcp2,'b')
% stem(distvec,tcp3,'g')
% legend('March 21','March 25','March 28')
% xlabel('Distance (m)')
% ylabel('TCP Throughput (kbps)')

% figure
% hold on
% stem(siglin,tcp,'r')
% stem(siglin2,tcp2,'b')
% stem(siglin3,tcp3,'g')
% legend('March 21','March 25','March 28')
% xlabel('Signal Strength (mW)')
% ylabel('TCP Throughput (kbps)')

% pecan_park_boundary(x,y);

% figure
% hold on
% image(map)
% scatter(x,y,50,'ro','filled')
% scatter(statx,staty,50,'go','filled')
% xlim([min(x)-100 max(x)+100])
% ylim([min(y)-100 max(y)+100])
% legend('Neighborhood Boundary','Mobile Node Locations','Fixed Node Location')
% axis ij

% figure
% hold on
% image(map)
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
% xlim([min(x) max(x)])
% ylim([min(y) max(y)])
% % zlim([0 max(siglin)])
% % stem3(x-minx,y-miny,siglin,'filled','b')
% stem3(statx-minx,staty-miny,max(siglin),'filled','r')
% stem3(x-minx,y-miny,tcp,'filled','g')
% axis ij
% title('Received Signal Power Plot')

% close all
% 
% figure
% stem(distvec4,siglin4)
% title('Signal Power vs. Distance')
% ylabel('Signal Power (mW)')
% xlabel('Distance (m)')
% 
% figure
% stem(distvec4,udp4)
% title('UDP Throughput vs. Distance')
% xlabel('Distance (m)')
% ylabel('Throughput (kb/s)')


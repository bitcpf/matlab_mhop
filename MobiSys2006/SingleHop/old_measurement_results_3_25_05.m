%MEASUREMENT_RESULTS_3_25_05.M
%Baseball bat to baseball bat ~25 feet on both sides, no rate limiting, TCP

function [sig,tcp,dist] = measurement_results_3_25_05(dummy)

%March 25 measurements
sig = zeros(10,1);
tcp = zeros(10,1);

%Stationary node
statx = 1336;
staty = 1003;

%Location 1
N(1) = 42.347; % GPS latitude minutes, degrees are all 29
W(1) = 16.982; % GPS longitude minutes, degrees are all 95
sig(1) = -5; %signal power in dBm
tcp(1) = 441*8; %tcp throughput in kbps

%Location 2
N(2) = 42.387; % GPS latitude minutes, degrees are all 29
W(2) = 17.021; % GPS longitude minutes, degrees are all 95
sig(2) = -18;
tcp(2) = 250*8;

%Location 3
N(3) = 42.261; % GPS latitude minutes, degrees are all 29
W(3) = 17.010; % GPS longitude minutes, degrees are all 95
sig(3) = -11;
tcp(3) = 400*8;

%Location 4
N(4) = 42.223;
W(4) = 16.951;
sig(4) = -11;
tcp(4) = 370*8;

%Location 5
%3-21-05
x(5) = 1375;
y(5) = 1104;
N(5) = 42.224;
W(5) = 16.930;
sig(5) = -23;
tcp(5) = 12*8;
%3-25-05
x2(5) = 1375;
y2(5) = 1104;
N2(5) = 42.222;
W2(5) = 16.930;
sig2(5) = -24;
tcp2(5) = 100*8;

%Location 6
%3-21-05
x(6) = 1436;
y(6) = 1109;
N(6) = 42.215;
W(6) = 16.872;
sig(6) = -13;
tcp(6) = 190*8;
%3-25-05
x2(6) = 1436;
y2(6) = 1109;
N2(6) = 42.220;
W2(6) = 16.873;
sig2(6) = -16;
tcp2(6) = 320*8;

%Location 7
%3-21-05
x(7) = 1500; %this value is very approximate
y(7) = 1023;
N(7) = 42.304;
W(7) = 16.796;
sig(7) = -27;
tcp(7) = 0; 
%3-25-05
x2(7) = 1500; %this value is very approximate
y2(7) = 1023;
N2(7) = 42.297;
W2(7) = 16.795;
sig2(7) = -26;
tcp2(7) = 35*8; 

%Location 8
%3-21-05
x(8) = 1450;
y(8) = 1014;
N(8) = 42.307;
W(8) = 16.854;
sig(8) = -15;
tcp(8) = 0; %unable to establish a connection for speeddaemon, could have been software issue
%3-25-05
x2(8) = 1450;
y2(8) = 1014;
N2(8) = 42.305;
W2(8) = 16.853;
sig2(8) = -22;
tcp2(8) = 110*8; 

%Location 9
%3-21-05
x(9) = 1327;
y(9) = 901;
N(9) = 42.425;
W(9) = 16.984;
sig(9) = -13;
tcp(9) = 230*8;
%3-25-05
x2(9) = 1327;
y2(9) = 901;
N2(9) = 42.426;
W2(9) = 16.980;
sig2(9) = -13;
tcp2(9) = 380*8;

%Location 10
%3-21-05
x(10) = 1435;
y(10) = 886;
N(10) = 42.427;
W(10) = 16.868;
sig(10) = -18;
tcp(10) = 220*8;
%3-25-05
x2(10) = 1435;
y2(10) = 886;
N2(10) = 42.429;
W2(10) = 16.870;
sig2(10) = -19;
tcp2(10) = 280*8;

%convert to dms GPS notation
%3-21-05
Ndeg = 29*ones(10,1);
Wdeg = 95*ones(10,1);
Nmin = floor(N);%get integer minutes
Wmin = floor(W);
Nsec = 60*(N-Nmin); %convert the decimal minutes to seconds
Wsec = 60*(W-Wmin);
Nmat = [Ndeg, Nmin', Nsec'];
Wmat = [Wdeg, Wmin', Wsec'];

%3-25-05
N2deg = 29*ones(10,1);
W2deg = 95*ones(10,1);
N2min = floor(N2);%get integer minutes
W2min = floor(W2);
N2sec = 60*(N2-N2min); %convert the decimal minutes to seconds
W2sec = 60*(W2-W2min);
N2mat = [N2deg, N2min', N2sec'];
W2mat = [W2deg, W2min', W2sec'];



%Analysis and visualization section
%3-21-05
siglin = 10.^(sig./10);
minx = min(x);
maxx = max(x);
miny = min(y);
maxy = max(y);
%3-25-05
siglin2 = 10.^(sig2./10);
minx2 = min(x2);
maxx2 = max(x2);
miny2 = min(y2);
maxy2 = max(y2);




pixeldist = zeros(length(x));
targetdist = zeros(length(x),1);
for n = 1:length(x)
    xn = x(n);
    yn = y(n);
    targetdist(n) = sqrt((xn-statx)^2 + (yn-staty)^2); %pixel distance to stationary antenna
    for m = 1:length(x)
        xm = x(m);
        ym = y(m);
        pixeldist(n,m) = sqrt((xn-xm)^2 + (yn-ym)^2); %pixel distance from each measurement point to all others
    end
end

pixeldist2 = zeros(length(x2));
targetdist2 = zeros(length(x2),1);
for n = 1:length(x2)
    xn = x2(n);
    yn = y2(n);
    targetdist(n) = sqrt((xn-statx)^2 + (yn-staty)^2); %pixel distance to stationary antenna
    for m = 1:length(x)
        xm = x(m);
        ym = y(m);
        pixeldist2(n,m) = sqrt((xn-xm)^2 + (yn-ym)^2); %pixel distance from each measurement point to all others
    end
end

distvec = targetdist2*1.7; %approximate distance to stationary antenna in meters

figure
hold on
stem(distvec,siglin2,'b')
stem(distvec,siglin,'r')
legend('Without Rate Limiting','With Rate Limiting')
xlabel('Distance (m)')
ylabel('Signal Strength (mW)')

figure
hold on
stem(distvec,tcp2,'b')
stem(distvec,tcp,'r')
legend('Without Rate Limiting','With Rate Limiting')
xlabel('Distance (m)')
ylabel('TCP Throughput (kbps)')

figure
hold on
stem(siglin2,tcp2,'b')
stem(siglin,tcp,'r')
legend('Without Rate Limiting','With Rate Limiting')
xlabel('Signal Strength (mW)')
ylabel('TCP Throughput (kbps)')

figure
hold on
image(map)
scatter(x,y,50,'r')
scatter(statx,staty,50,'g')
xlim([min(x)-100 max(x)+100])
ylim([min(y)-100 max(y)+100])
legend('Mobile Node Locations','Fixed Node Location')
axis ij

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


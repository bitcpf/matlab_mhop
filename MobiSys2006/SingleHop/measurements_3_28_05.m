%MEASUREMENTS_3_28_05
%On 3-21 we had some kind of rate limiting in place.
%On 3-25 we removed the rate limiting
%On 3-28 we used "light sabre" antennas at both sides, elevated to ~35' at
%Ben's house
%The measurement locations should be approximately the same, but we took
%separate GPS readings

% map = imread('pecan_park_map.tif');
% flatmap = allpixels_2_num(map); %make the map two dimensional instead of rgb

%March 21 measurements
x = zeros(10,1);
y = zeros(10,1);
sig = zeros(10,1);
tcp = zeros(10,1);

%March 25 measurements
x2 = zeros(10,1);
y2 = zeros(10,1);
sig2 = zeros(10,1);
tcp2 = zeros(10,1);

%March 28 measurements
x3 = zeros(10,1);
y3 = zeros(10,1);
sig3 = zeros(10,1);
tcp3 = zeros(10,1);

%Stationary node
statx = 1336;
staty = 1003;

%Location 1
%3-21-05
x(1) = 1330; %x coordinate on tiff map
y(1) = 987; %y coordinate on tiff map
N(1) = 42.344; % GPS latitude minutes, degrees are all 29
W(1) = 16.986; % GPS longitude minutes, degrees are all 95
sig(1) = -6; %signal power in dBm
tcp(1) = 240*8; %tcp throughput in kbps
%3-25-05
x2(1) = 1330; %x coordinate on tiff map
y2(1) = 987; %y coordinate on tiff map
N2(1) = 42.347; % GPS latitude minutes, degrees are all 29
W2(1) = 16.982; % GPS longitude minutes, degrees are all 95
sig2(1) = -5; %signal power in dBm
tcp2(1) = 441*8; %tcp throughput in kbps
%3-25-05
x3(1) = 1330; %x coordinate on tiff map
y3(1) = 987; %y coordinate on tiff map
N3(1) = 42.347; % GPS latitude minutes, degrees are all 29
W3(1) = 16.982; % GPS longitude minutes, degrees are all 95
sig3(1) = -11; %signal power in dBm
tcp3(1) = 320*8; %tcp throughput in kbps

%Location 2
%3-21-05
x(2) = 1290; %x coordinate on tiff map
y(2) = 934; %y coordinate on tiff map
N(2) = 42.388; % GPS latitude minutes, degrees are all 29
W(2) = 17.016; % GPS longitude minutes, degrees are all 95
sig(2) = -13;
tcp(2) = 200*8;
%3-25-05
x2(2) = 1290; %x coordinate on tiff map
y2(2) = 934; %y coordinate on tiff map
N2(2) = 42.387; % GPS latitude minutes, degrees are all 29
W2(2) = 17.021; % GPS longitude minutes, degrees are all 95
sig2(2) = -18;
tcp2(2) = 250*8;
%3-28-05
x3(2) = 1290; %x coordinate on tiff map
y3(2) = 934; %y coordinate on tiff map
N3(2) = 42.387; % GPS latitude minutes, degrees are all 29
W3(2) = 17.021; % GPS longitude minutes, degrees are all 95
sig3(2) = -13;
tcp3(2) = 410*8;

%Location 3
%3-21-05
x(3) = 1310; %x coordinate on tiff map
y(3) = 1068; %y coordinate on tiff map
%I DON'T BELIEVE THE GPS COORDINATES FOR THIS POINT!!!
%IT LOOKS LIKE IT DIDN'T REFRESH FROM THE PREVIOUS LOCATION
N(3) = 42.390; % GPS latitude minutes, degrees are all 29
W(3) = 17.018; % GPS longitude minutes, degrees are all 95
sig(3) = -11;
tcp(3) = 238*8;
%3-25-05
x2(3) = 1310; %x coordinate on tiff map
y2(3) = 1068; %y coordinate on tiff map
N2(3) = 42.261; % GPS latitude minutes, degrees are all 29
W2(3) = 17.010; % GPS longitude minutes, degrees are all 95
sig2(3) = -11;
tcp2(3) = 400*8;
%3-28-05
x3(3) = 1310; %x coordinate on tiff map
y3(3) = 1068; %y coordinate on tiff map
N3(3) = 42.261; % GPS latitude minutes, degrees are all 29
W3(3) = 17.010; % GPS longitude minutes, degrees are all 95
sig3(3) = -8.5;
tcp3(3) = 440*8;

%Location 4
%3-21-05
x(4) = 1360;
y(4) = 1105;
%THESE ARE ACTUALLY THE GPS COORDINATES FROM LOCATION 5!!!
N(4) = 42.224;
W(4) = 16.930;
sig(4) = -18;
tcp(4) = 40*8;
%3-25-05
x2(4) = 1360;
y2(4) = 1105;
N2(4) = 42.223;
W2(4) = 16.951;
sig2(4) = -11;
tcp2(4) = 370*8;
%3-28-05
x3(4) = 1360;
y3(4) = 1105;
N3(4) = 42.223;
W3(4) = 16.951;
sig3(4) = -10;
tcp3(4) = 380*8;

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
%3-28-05
x3(5) = 1375;
y3(5) = 1104;
N3(5) = 42.222;
W3(5) = 16.930;
sig3(5) = -26;
tcp3(5) = 0*8;

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
%3-28-05
x3(6) = 1436;
y3(6) = 1109;
N3(6) = 42.220;
W3(6) = 16.873;
sig3(6) = -12;
tcp3(6) = 390*8;

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
%3-28-05
x3(7) = 1500; %this value is very approximate
y3(7) = 1023;
N3(7) = 42.297;
W3(7) = 16.795;
sig3(7) = -27;
tcp3(7) = 45*8; 

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
%3-28-05
x3(8) = 1450;
y3(8) = 1014;
N3(8) = 42.305;
W3(8) = 16.853;
sig3(8) = -24;
tcp3(8) = 100*8;

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
%3-28-05
x3(9) = 1327;
y3(9) = 901;
N3(9) = 42.426;
W3(9) = 16.980;
sig3(9) = -22;
tcp3(9) = 320*8;

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
%3-28-05
x3(10) = 1435;
y3(10) = 886;
N3(10) = 42.429;
W3(10) = 16.870;
sig3(10) = -24;
tcp3(10) = 0*8;

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

%3-28-05 We didn't take new GPS, so this is just the same as the second
%round measurements
N3deg = 29*ones(10,1);
W3deg = 95*ones(10,1);
N3min = floor(N3);%get integer minutes
W3min = floor(W3);
N3sec = 60*(N3-N3min); %convert the decimal minutes to seconds
W3sec = 60*(W3-W3min);
N3mat = [N3deg, N3min', N3sec'];
W3mat = [W3deg, W3min', W3sec'];



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
%3-28-05
siglin3 = 10.^(sig3./10);
minx3 = min(x3);
maxx3 = max(x3);
miny3 = min(y3);
maxy3 = max(y3);




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

pixeldist2 = zeros(length(x2));
targetdist2 = zeros(length(x2),1);
for n = 1:length(x2)
    xn = x2(n);
    yn = y2(n);
    targetdist2(n) = sqrt((xn-statx)^2 + (yn-staty)^2); %pixel distance to stationary antenna
    for m = 1:length(x2)
        xm = x2(m);
        ym = y2(m);
        pixeldist2(n,m) = sqrt((xn-xm)^2 + (yn-ym)^2); %pixel distance from each measurement point to all others
    end
end
% 
% pixeldist3 = zeros(length(x3));
% targetdist3 = zeros(length(x3),1);
% for n = 1:length(x3)
%     xn = x3(n);
%     yn = y3(n);
%     targetdist3(n) = sqrt((xn-statx)^2 + (yn-staty)^2); %pixel distance to stationary antenna
%     for m = 1:length(x3)
%         xm = x3(m);
%         ym = y3(m);
%         pixeldist3(n,m) = sqrt((xn-xm)^2 + (yn-ym)^2); %pixel distance from each measurement point to all others
%     end
% end

distvec = targetdist2*1.7; %approximate distance to stationary antenna in meters

% distvec = [8.40808; 97.85968; 145.73388; 226.42552; 238.7228; 304.70956; 328.69296; 245.96412; 187.2372; 296.32];
% distvec(1) = 75;

% size(distvec)
% size(siglin)
% size(siglin2)

% [bestP,bestalpha,bestL] = fit_pathloss(distvec(2:10),siglin(2:10))
% d = [distvec(2:10); distvec(2:10); distvec(2:10)];
% s = [siglin(2:10); siglin2(2:10); siglin3(2:10)];
% d = [distvec(2:10); distvec(2:10)];
% s = [siglin(2:10); siglin2(2:10)];
d = [distvec; distvec; distvec];
s = [siglin; siglin2; siglin3];
[bestP,bestalpha,bestL] = fit_pathloss(d,s)
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


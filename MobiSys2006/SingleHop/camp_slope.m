%BRIDGE_ANALYSIS.M
%This script analyzes the pathloss characteristics of all measurements with
%a baseball bat antenna at 30' (5-10 and 5-17 measurements). It outputs the
%following plots:
%Received power versus distance, theoretical and empirical
%Shadowing distribution, with Gaussian density fit
%Pathloss exponent versus obstruction (looking for correlation)
%Pathloss exponent distribution


P0 = -32; %reference power
d0 = 9.144; %reference distance

% P0 = -8;
% d0 = 18.40888;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WE NEED A NEW REFERENCE POWER AND DISTANCE FOR A BRIDGE %
% FOR NOW, WE'LL JUST USE THE CLOSEST MEASUREENT          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map = imread('pecan_park_map.tif');
rmat = map(:,:,1); %peel apart the color layers
gmat = map(:,:,2);
bmat = map(:,:,3);
intmap = rgb_2_num(rmat,gmat,bmat); %convert colors to integers
%obstruction is numbers 1,2,3,4,5 or 7
los_indices = find((intmap == 0)|(intmap == 6)); %either green space or unclassified
binmap = ones(size(intmap)); %preallocate a binary map
binmap(los_indices) = 0; %place zeros where there is no obstruction present
figure
imagesc(binmap)
colorbar

% [sig1, sigvar1, udp1, udpvar1, N1, W1, Nstat1, Wstat1] = measurement_results_5_10_05(0);
% [sig2, sigvar2, udp2, udpvar2, N2, W2, Nstat2, Wstat2] = measurement_results_5_17_05(0);

[sig, sigvar, udp, udpvar, N, W, Nstat, Wstat] = measurement_results_bridge(0);

%3*length(sig)

L = length(N);

% L1 = length(N1); %number of measurements
% L2 = length(N2); %number of measurements

sig = sig - 60;

% sig = [sig1; sig2] - 30;%signal power corrected to make units same as reference units
% sigvar = [sigvar1; sigvar2];
% udp = [udp1; udp2];
% udpvar = [udpvar1; udpvar2];

% [xstat1,ystat1] = gps_2_xy(Nstat1,Wstat1);
% [xstat2,ystat2] = gps_2_xy(Nstat2,Wstat2);

[xstat, ystat] = gps_2_xy(Nstat,Wstat);

obs = zeros(L,1);
dist = zeros(L,1);
xvec = zeros(L,1);
yvec = zeros(L,1);

for n = 1:L
    dist(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obs(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end

distmat = [dist dist dist];

distvec = distmat(:);

sigmat = [(sig-sigvar) sig (sig+sigvar)];
sigvec = sigmat(:);

udpmat = [(udp-udpvar) udp (udp+udpvar)];
udpvec = udpmat(:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pathloss Exponent Section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = get_plexp(distvec(:),sigvec(:));

index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigmaalpha = std(alpha);
sigmaalphastr = num2str(sigmaalpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index)); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);

%%%%%%%%%%%%%%%%%%%%%%%%%
% Received Power Curves %
%%%%%%%%%%%%%%%%%%%%%%%%%

if 0

dvec = 1:max(distvec);
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
figure
hold on
scatter(distvec,sigvec)
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b--')
plot(dvec,pvec+sigma,'g-.')
plot(dvec,pvec-sigma,'g-.')
plot(dvec,pvec+2*sigma,'r:')
plot(dvec,pvec-2*sigma,'r:')
legend('Measurements','Free Space','Mean','+1 Stdev','-1 Stdev','+2 Stdev','-2 Stdev')
xlabel('Distance (m)')
ylabel('Received Signal Power (dBm)')
gtext(['Pathloss Exponent = ' mualphastr ', Shadowing Std = ' sigmastr])

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Received Power Distribution %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
    
figure
histfit(diffvec)
xlabel('Received Signal Power Deviation From Mean (dBm)')
ylabel('Number of Instances')
text(0,max(hist(diffvec))-5,['Standard Deviation = ' sigmastr]);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pathloss Exponent Distribution %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
    
figure
hist(alpha)
xlabel('Pathloss Exponent Value')
ylabel('Number of Instances')
text(0,max(hist(alpha(index)))-5,['Mean Pathloss Exponent = ' mualphastr ', Pathloss Exponent Std = ' sigmaalphastr])

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pathloss Versus Obstruction %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
    
obsmat = [obs obs obs];
obsvec = obsmat(:);
obsvec = obsvec(index);

index2 = find(alpha > 3); 

% alphamat = [alpha(index) alpha(index) alpha(index)];
% alphavec = alphamat(:);

vec = 0:0.01:1;

fit = polyfit(obsvec(index2),alpha(index2),1);
linefit = polyval(fit,obsvec(index2));
fitline = polyval(fit,vec);
diffvec = alpha(index2) - linefit;

stdev = std(diffvec)
slope = fit(1)

[r,p] = corrcoef(alpha(index2),obsvec(index2))

figure
hold on
scatter(obsvec(index2),alpha(index2))
% plot(obsvec(index2),linefit)
plot(vec,fitline)
plot(vec,fitline+stdev,'--')
plot(vec,fitline-stdev,'--')
xlabel('Fraction of Obstruction')
ylabel('Pathloss Exponent')
xlim([0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pathloss versus Distance %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dvec = distvec(index);

index2 = find(alpha > 3); 

% alphamat = [alpha(index) alpha(index) alpha(index)];
% alphavec = alphamat(:);

vec = min(dvec):max(dvec);

fit = polyfit(dvec(index2),alpha(index2),1);
linefit = polyval(fit,dvec(index2));
fitline = polyval(fit,vec);
diffvec = alpha(index2) - linefit;

stdev = std(diffvec)
slope = fit(1)

[r,p] = corrcoef(alpha(index2),dvec(index2))

figure
hold on
scatter(dvec(index2),alpha(index2))
% plot(obsvec(index2),linefit)
plot(vec,fitline)
plot(vec,fitline+stdev,'--')
plot(vec,fitline-stdev,'--')
xlabel('Distance')
ylabel('Pathloss Exponent')

end
%%%%%%%%%%%%%%%%%%%%%%
% Throughput Section %
%%%%%%%%%%%%%%%%%%%%%%

if 1

index = find(sigvec < -60);
sigvec = sigvec(index);
udpvec = udpvec(index);

[sortsig,order] = sort(sigvec);%adding 100 makes this SNR instead of signal power
sortudp = udpvec(order);

% sortsig = sortsig + 100;
lolim = -88.7;
hilim = -71.3;
linevec = lolim:0.1:hilim;

p1 = polyfit(sortsig,sortudp,1); %polynomial coefficients
p2 = polyfit(sortsig,sortudp,2);
p3 = polyfit(sortsig,sortudp,3);
% xvec = min(sigvec):max(sigvec);
% poly1 = polyval(p1,sortsig); %evaluate the fitting polynomial
poly1 = polyval(p1,linevec);
poly2 = polyval(p2,linevec);
poly3 = polyval(p3,linevec);
%diff1 = sortudp - poly1; %deviation from first order fit
%diff2 = sortudp - poly2;    
%diff3 = sortudp - poly3;
figure
hold on
%JC scatter(sortsig,sortudp,'b')
plot(linevec,poly1,'k')
plot(linevec,poly2,'r')
plot(linevec,poly3,'g')
% title('5-10 and 5-17 UDP Measurements')
xlabel('Received Signal Strength (dBm)')
ylabel('UDP Throughput (kb/s)')
xlim([-100 -50])
ylim([0 7000])
%line([-100, hilim; lolim, -50],[0, 6000; 0, 6000]) 
end

if 0
figure
subplot(3,1,1)
histfit(diff1)
title(['Std = ' num2str(std(diff1))])
subplot(3,1,2)
histfit(diff2)
title(['Std = ' num2str(std(diff2))])
subplot(3,1,3)
histfit(diff3)
title(['Std = ' num2str(std(diff3))])

end

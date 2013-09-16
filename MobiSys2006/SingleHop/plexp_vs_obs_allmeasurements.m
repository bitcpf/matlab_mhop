%PLEXP_VS_OBS_ALLMEASUREMENTS.M
%This script calculates a pathloss exponent value for every measurement and
%correlates it with the amount of obstruction along the signal path.

clear all

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
hold on

%%%%%%%%%%%%%%%%%%%%%
% 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_21_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
obsvec = zeros(L,1);
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
%     obs_frac(xvec(n),yvec(n),xstat,ystat)
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,1)
% figure
scatter(obsvec(:),alpha)
title('3-21 Measurements')
% obsvec
% alpha
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_25_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,2)
scatter(obsvec(:),alpha)
title('3-25 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_28_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,3)
scatter(obsvec(:),alpha)
title('3-28 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%%%%%%%%%%%%%%%%
% 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_7_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,4)
scatter(obsvec(:),alpha)
title('4-7 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_21_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,5)
scatter(obsvec(:),alpha)
title('4-21 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_10_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec - 30;
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,6)
obs1 = obsvec;
alpha1 = alpha;
scatter(obsvec(:),alpha)
title('5-10 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_12_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
subplot(4,2,7)
scatter(obsvec(:),alpha)
title('5-12 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_17_05(0);
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
    [xvec(n),yvec(n)] = gps_2_xy(N(n),W(n));
    obsvec(n) = obs_frac(xvec(n),yvec(n),xstat,ystat,binmap);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec - 30;
distvec = [distvec distvec distvec];
obsvec = [obsvec obsvec obsvec];
alpha = get_plexp(distvec(:),sigvec(:));
obs2 = obsvec;
alpha2 = alpha;
subplot(4,2,8)
scatter(obsvec(:),alpha)
title('5-17 Measurements')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec xvec yvec obsvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Combined 5-10 and 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

obs = [obs1(:); obs2(:)];
alpha = [alpha1(:); alpha2(:)];
vec = 0:0.01:1;
fit = polyfit(obs,alpha,1);
fitcurve = polyval(fit,obs);
diffvec = alpha - fitcurve;
stdev = std(diffvec)
slope = fit
fitline = polyval(fit,vec);

[r,p] = corrcoef(alpha,obs)

figure
hold on
scatter(obs,alpha)
plot(vec,fitline)
plot(vec,fitline + stdev,'--')
plot(vec,fitline - stdev,'--')
xlabel('Fraction of Obstruction')
ylabel('Pathloss Exponent')
ylim([1 5])
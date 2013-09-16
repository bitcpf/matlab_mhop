%RXPOWER_CURVES_ALLMEASUREMENTS.M
%This script calculates a pathloss exponent value for each measurement,
%then it gets the mean pathloss value for each measurement set and
%calculates the theoretical pathloss values as a function of distance and
%the average pathloss exponent. Then it draws curves showing predicted
%signal power plus or minus one standard deviation

clear all

figure
hold on

P0 = -2;
d0 = 9.144;

%%%%%%%%%%%%%%%%%%%%%
% 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_21_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,1)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['3-21 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_25_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,2)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['3-25 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_28_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,3)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['3-28 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%%%%%%%%%%%%%%%%
% 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_7_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,4)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['4-7 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_21_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,5)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['4-21 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_10_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,6)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['5-10 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_12_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,7)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['5-12 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_17_05(0);
L = length(N); %number of measurements
for n = 1:L
    distvec(n) = gps2dist(N(n),W(n),Nstat,Wstat);
end
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
distvec = [distvec distvec distvec];
distvec = distvec(:);
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mualpha = mean(alpha);
mualphastr = num2str(mualpha);
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = std(diffvec);
sigmastr = num2str(sigma);
%create theoretical curves
dvec = 1:400;
lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
pvec = P0 - 10*mualpha*log10(dvec/d0);
subplot(4,2,8)
hold on
scatter(distvec,(sigvec-30))
plot(dvec,lospvec,'k')
plot(dvec,pvec,'b')
plot(dvec,pvec+sigma,'g')
plot(dvec,pvec-sigma,'g')
plot(dvec,pvec+2*sigma,'r')
plot(dvec,pvec-2*sigma,'r')
title(['5-17 Measurements: PL Exp = ' mualphastr ', Std. Dev. = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
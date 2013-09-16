%THROUGHPUT_ALLMEASUREMENTS.M
%This script finds UDP throughput as a function of signal strength, SNR,
%and distance. It provides mean and variance as well as some curve fitting.

clear all

figure
hold on

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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,1)
histfit(diffvec)
% xlim([0 6])
title(['3-21 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,2)
histfit(diffvec)
title(['3-25 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,3)
histfit(diffvec)
title(['3-28 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,4)
histfit(diffvec)
title(['4-7 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,5)
histfit(diffvec)
title(['4-21 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,6)
histfit(diffvec)
title(['5-10 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,7)
histfit(diffvec)
title(['5-12 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
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
sigvec_th = rxpower_vs_dist(distvec(index),mualpha); %theoretical signal powers
diffvec = sigvec_th - (sigvec(index) - 30); %difference between theoretical and actual powers
mu = mean(diffvec);
mustr = num2str(mu);
sigma = var(diffvec);
sigmastr = num2str(sigma);
subplot(4,2,8)
histfit(diffvec)
title(['5-17 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
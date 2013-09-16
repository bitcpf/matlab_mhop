%PLEXP_ALLMEASUREMENTS.M
%This script calculates a pathloss exponent value for every measurement,
%groups them by measurement date, and plots histograms for each.

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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
subplot(4,2,1)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,2)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,3)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,4)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,5)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,6)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,7)
hist(alpha)
xlim([0 6])
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
distvec = [distvec distvec distvec];
alpha = get_plexp(distvec(:),sigvec(:));
index = find(alpha < 6);
alpha = alpha(index); %remove outliers
mu = mean(alpha);
sigma = var(alpha);
mustr = num2str(mu);
sigmastr = num2str(sigma);
% index = find(alpha < 6);
subplot(4,2,8)
hist(alpha)
xlim([0 6])
title(['5-17 Measurements: Mean = ' mustr ', Variance = ' sigmastr])
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha distvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
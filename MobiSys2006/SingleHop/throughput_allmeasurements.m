%THROUGHPUT_ALLMEASUREMENTS.M
%This script finds throughput as a function of signal strength and SNR. 
%It provides mean and variance as well as some curve fitting.

clear all

figure
hold on

%%%%%%%%%%%%%%%%%%%%%
% 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_21_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,1)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('3-21 TCP Measurements (Rate-Limited)')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_25_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,2)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('3-25 TCP Measurements')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-25 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_28_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,3)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('3-28 TCP Measurements')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 3-28 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%%%%%%%%%%%%%%%%
% 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_7_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,4)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('4-7 UDP Measurements')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-7 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_4_21_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,5)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('4-21 UDP Measurements')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 4-21 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_10_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,6)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('5-10 UDP Measurements')
xlabel('Signal Strength')
s1 = sigvec;
t1 = tcpvec;
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-10 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_12_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,7)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('5-12 UDP Measurements')
xlabel('Signal Strength')
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-12 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
% 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%
[sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_5_17_05(0);
sigvec = [(sig - sigvar) sig (sig+sigvar)];
sigvec = sigvec(:);
% sigvec = 10.^(sigvec./10);
tcpvec = [(tcp - tcpvar) tcp (tcp + tcpvar)];
tcpvec = tcpvec(:);
p1 = polyfit(sigvec,tcpvec,1); %polynomial coefficients
p2 = polyfit(sigvec,tcpvec,2);
p3 = polyfit(sigvec,tcpvec,3);
xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,xvec); %evaluate the fitting polynomial
poly2 = polyval(p2,xvec);
poly3 = polyval(p3,xvec);
subplot(4,2,8)
hold on
scatter(sigvec,tcpvec,'b')
plot(xvec,poly1,'k')
plot(xvec,poly2,'r')
plot(xvec,poly3,'g')
title('5-17 UDP Measurements')
xlabel('Signal Strength')
s2 = sigvec;
t2 = tcpvec;
clear sig sigvar tcp tcpvar N W Nstat Wstat L alpha sigvec tcpvec
%%%%%%%%%%%%%%%%%%%%%%%%%
% End 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Combined 5-10 and 5-17 Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigvec = ([s1; s2] - 60);
tcpvec = [t1; t2];

[sortsig,order] = sort(sigvec);
sorttcp = tcpvec(order);

lolim = -86.4;
hilim = -65.8;
linevec = lolim:0.1:hilim;

p1 = polyfit(sortsig,sorttcp,1); %polynomial coefficients
p2 = polyfit(sortsig,sorttcp,2);
p3 = polyfit(sortsig,sorttcp,3);
% xvec = min(sigvec):max(sigvec);
poly1 = polyval(p1,linevec); %evaluate the fitting polynomial
poly2 = polyval(p2,sortsig);
poly3 = polyval(p3,sortsig);
%diff1 = sorttcp - poly1; %deviation from first order fit
%diff2 = sorttcp - poly2;    
%diff3 = sorttcp - poly3;
figure
hold on
scatter(sortsig,sorttcp,'b')
plot(linevec,poly1,'k')

gtext('Slope = X-Intercept = ')
% plot(sortsig,poly2,'r')
% plot(sortsig,poly3,'g')
%title('5-10 and 5-17 UDP Measurements')
xlabel('Received Signal Strength (dBm)')
ylabel('UDP Throughput (kb/s)')
xlim([-100 -50])
ylim([0 7000])
line([-100, hilim; lolim, -50],[0, 5000; 0, 5000]) 

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
%MEASUREMENT_RESULTS_5_10_05.M

function [sig,sigvar,udp,udpvar,Nvec,Wvec,Nstat,Wstat] = old_measurement_results_5_10_05(dummy)

%MEASUREMENTS_5_10_05.M
%23 measurements taken centered around Ben's house with a pair of baseball bat antennas at 30 ft. elevation

Nvec = zeros(20,1);
Wvec = zeros(20,1);
sigvec = zeros(20,1);
sigvar = zeros(20,1);
udpvec = zeros(20,1);
udpvar = zeros(20,1);
distvec = zeros(20,1);

%Ben's House
Nstat = 42.341;
Wstat = 16.993;

%location 1
%7911 Adrian
Nvec(1) = 42.350;
Wvec(1) = 16.821;
sigvec(1) = -15;
sigvar(1) = 2;
udpvec(1) = 380*8;
udpvar(1) = 10*8;
distvec(1) = gps2dist(Nvec(1),Wvec(1),Nstat,Wstat); %distance to transmitting antenna

%location 2
%NW corner of Adrian and Fennel
Nvec(2) = 42.346;
Wvec(2) = 16.853;
sigvec(2) = -22;
sigvar(2) = 2;
udpvec(2) = 100*8;
udpvar(2) = 50*8;
distvec(2) = gps2dist(Nvec(2),Wvec(2),Nstat,Wstat); %distance to transmitting antenna

%location 3
%7825 Keller
Nvec(3) = 42.389;
Wvec(3) = 16.884;
sigvec(3) = -15;
sigvar(3) = 2;
udpvec(3) = 450*8;
udpvar(3) = 20*8;
distvec(3) = gps2dist(Nvec(3),Wvec(3),Nstat,Wstat); %distance to transmitting antenna

%location 4
%7807 Keller, possible LOS
Nvec(4) = 42.387;
Wvec(4) = 16.915;
sigvec(4) = -8;
sigvar(4) = 1;
udpvec(4) = 560*8;
udpvar(4) = 20*8;
distvec(4) = gps2dist(Nvec(4),Wvec(4),Nstat,Wstat); %distance to transmitting antenna

% %location 5
% %7804 Keller
% Nvec(5) = 42.384;
% Wvec(5) = 16.920;
% sigvec(5) = -8.5;
% sigvar(5) = 0;
% udpvec(5) = 425*8;
% udpvar(5) = 2*8;
% distvec(5) = gps2dist(Nvec(5),Wvec(5),Nstat,Wstat); %distance to transmitting antenna

%location 6
%7710 Narcissus, antenna in foliage
Nvec(5) = 42.426;
Wvec(5) = 16.983;
sigvec(5) = -20.5;
sigvar(5) = 1.5;
udpvec(5) = 250*8;
udpvar(5) = 50*8;
distvec(5) = gps2dist(Nvec(5),Wvec(5),Nstat,Wstat); %distance to transmitting antenna

% %location 7
% %7724 Narcissus
% Nvec(7) = 42.430;
% Wvec(7) = 16.957;
% sigvec(7) = -20;
% sigvar(7) = 2;
% udpvec(7) = 375*8;
% udpvar(7) = 10*8;
% distvec(7) = gps2dist(Nvec(7),Wvec(7),Nstat,Wstat); %distance to transmitting antenna

%location 8
%7734 Narcissus
Nvec(6) = 42.430;
Wvec(6) = 16.937;
sigvec(6) = -21;
sigvar(6) = 1;
udpvec(6) = 50*8;
udpvar(6) = 10*8;
distvec(6) = gps2dist(Nvec(6),Wvec(6),Nstat,Wstat); %distance to transmitting antenna

%location 9
%7815 Narcissus
Nvec(7) = 42.431;
Wvec(7) = 16.892;
sigvec(7) = -16;
sigvar(7) = 1;
udpvec(7) = 400*8;
udpvar(7) = 25*8;
distvec(7) = gps2dist(Nvec(7),Wvec(7),Nstat,Wstat); %distance to transmitting antenna

%location 10
%7829 Narcissus
Nvec(8) = 42.427;
Wvec(8) = 16.868;
sigvec(8) = -13;
sigvar(8) = 1;
udpvec(8) = 450*8;
udpvar(8) = 10*8;
distvec(8) = gps2dist(Nvec(8),Wvec(8),Nstat,Wstat); %distance to transmitting antenna

% %location 11
% %7832 Glover
% Nvec(11) = 42.222;
% Wvec(11) = 16.858;
% sigvec(11) = -25;
% sigvar(11) = 1;
% udpvec(11) = 40*8;
% udpvar(11) = 10*8;
% distvec(11) = gps2dist(Nvec(11),Wvec(11),Nstat,Wstat); %distance to transmitting antenna

%location 12
%7822 Glover
Nvec(9) = 42.220;
Wvec(9) = 16.870;
sigvec(9) = -18;
sigvar(9) = 2;
udpvec(9) = 380*8;
udpvar(9) = 20*8;
distvec(9) = gps2dist(Nvec(9),Wvec(9),Nstat,Wstat); %distance to transmitting antenna

%location 13
%7811 Glover
%Also measured throughput of 150 plus/minus 20
Nvec(10) = 42.226;
Wvec(10) = 16.901;
sigvec(10) = -24;
sigvar(10) = 2;
udpvec(10) = 200*8;
udpvar(10) = 20*8;
distvec(10) = gps2dist(Nvec(10),Wvec(10),Nstat,Wstat); %distance to transmitting antenna

%location 14
%7803 Glover
Nvec(11) = 42.223;
Wvec(11) = 16.919;
sigvec(11) = -23;
sigvar(11) = 1;
udpvec(11) = 250*8;
udpvar(11) = 20*8;
distvec(11) = gps2dist(Nvec(11),Wvec(11),Nstat,Wstat); %distance to transmitting antenna

%location 15
%7727 Glover
Nvec(12) = 42.224;
Wvec(12) = 16.940;
sigvec(12) = -20;
sigvar(12) = 2;
udpvec(12) = 50*8;
udpvar(12) = 10*8;
distvec(12) = gps2dist(Nvec(12),Wvec(12),Nstat,Wstat); %distance to transmitting antenna

% %location 16
% %7719 Glover
% Nvec(16) = 42.221;
% Wvec(16) = 16.948;
% sigvec(16) = -19;
% sigvar(16) = 2;
% udpvec(16) = 275*8;
% udpvar(16) = 10*8;
% distvec(16) = gps2dist(Nvec(16),Wvec(16),Nstat,Wstat); %distance to transmitting antenna

%location 17
%7717 Glover
Nvec(13) = 42.222;
Wvec(13) = 16.956;
sigvec(13) = -10;
sigvar(13) = 1/2;
udpvec(13) = 520*8;
udpvar(13) = 10*8;
distvec(13) = gps2dist(Nvec(13),Wvec(13),Nstat,Wstat); %distance to transmitting antenna

%location 18
%7710 Glover
Nvec(14) = 42.224;
Wvec(14) = 16.982;
sigvec(14) = -22.5;
sigvar(14) = 1.5;
udpvec(14) = 60*8;
udpvar(14) = 10*8;
distvec(14) = gps2dist(Nvec(14),Wvec(14),Nstat,Wstat); %distance to transmitting antenna

%location 19
%7511 Keller
Nvec(15) = 42.392;
Wvec(15) = 17.127;
sigvec(15) = -14;
sigvar(15) = 1;
udpvec(15) = 450*8;
udpvar(15) = 10*8;
distvec(15) = gps2dist(Nvec(15),Wvec(15),Nstat,Wstat); %distance to transmitting antenna

%location 20
%7503 Keller
Nvec(16) = 42.390;
Wvec(16) = 17.151;
sigvec(16) = -25;
sigvar(16) = 1;
udpvec(16) = 55*8;
udpvar(16) = 10*8;
distvec(16) = gps2dist(Nvec(16),Wvec(16),Nstat,Wstat); %distance to transmitting antenna

%location 21
%7507 Keller
Nvec(17) = 42.387;
Wvec(17) = 17.135;
sigvec(17) = -26.5;
sigvar(17) = 1/2;
udpvec(17) = 50*8;
udpvar(17) = 10*8;
distvec(17) = gps2dist(Nvec(17),Wvec(17),Nstat,Wstat); %distance to transmitting antenna

%location 22
%7523 Keller
Nvec(18) = 42.385;
Wvec(18) = 17.103;
sigvec(18) = -23;
sigvar(18) = 1;
udpvec(18) = 40*8;
udpvar(18) = 10*8;
distvec(18) = gps2dist(Nvec(18),Wvec(18),Nstat,Wstat); %distance to transmitting antenna

%location 23
%7615 Keller
Nvec(19) = 42.384;
Wvec(19) = 17.060;
sigvec(19) = -20;
sigvar(19) = 2;
udpvec(19) = 220*8;
udpvar(19) = 20*8;
distvec(19) = gps2dist(Nvec(19),Wvec(19),Nstat,Wstat); %distance to transmitting antenna

%location 24
%7829 Scurlock (near original location 8)
Nvec(20) = 42.308;
Wvec(20) = 16.860;
sigvec(20) = -26;
sigvar(20) = 1;
udpvec(20) = 50*8;
udpvar(20) = 10*8;
distvec(20) = gps2dist(Nvec(20),Wvec(20),Nstat,Wstat);

%VISUALIZATION SECTION
siglinvec = 10.^(sigvec./10); %signal power in mW

sig = sigvec; %make proper outputs for function
% sigvar = sigvarvec;
udp = udpvec;
% udpvar = udpvarvec;
dist = distvec;


% [sigls,sigvarls,udpls,udpvarls,distls] = measurement_results_4_21_05(dummy);
% 
% linsigls = 10.^(sigls/10);
% linsiglsplus = 10.^((sigls+sigvarls)/10);
% linsiglsminus = 10.^((sigls-sigvarls)/10);
% linsigvarls = 10.^(sigvarls/10);
% linsigvec = 10.^(sigvec/10);
% linsigplus = 10.^((sigvec+sigvar)/10);
% linsigminus = 10.^((sigvec-sigvar)/10);
% linsigvar = 10.^(sigvar/10);
% 
% figure
% scatter(distvec,linsigvec,'bo')
% hold on
% scatter(distvec,linsigplus,'b+')
% scatter(distvec,linsigminus,'b.')
% scatter(distls,linsigls,'ro')
% scatter(distls,linsiglsplus,'r+')
% scatter(distls,linsiglsminus,'r.')
% xlabel('distance')
% ylabel('signal power (dBm)')
% title('Signal Power vs. Distance')
% grid on
% 
% figure
% hold on
% scatter(distvec,udpvec,'bo')
% scatter(distvec,udpvec+udpvar,'b+')
% scatter(distvec,udpvec-udpvar,'b.')
% scatter(distls,udpls,'ro')
% scatter(distls,udpls+udpvarls,'r+')
% scatter(distls,udpls-udpvarls,'r.')
% xlabel('distance')
% ylabel('UDP throughput (kb/s)')
% title('Throughput vs. Distance')
% grid on
% 
% siglsholes = [1 2 3 4 6 8 9 10 12 13 14 15 17 18 19 20 21 22 23];
% sigholes = 1:19;
% 
% diffvec = sigvec(sigholes) - sigls(siglsholes);
% figure
% scatter(dist(sigholes),diffvec,'g','filled')
% line([0 300],[0 0])
% title('Baseball Bat Signal minus Light Saber Signal')
% 
% % figure
% % scatter(distvec,siglinvec,'bo','filled')
% % title('Signal Power vs. Distance')
% % ylabel('Signal Power (mW)')
% % xlabel('Distance (m)')
% % 
% % figure
% % stem(distvec,udpvec)
% % title('UDP Throughput vs. Distance')
% % xlabel('Distance (m)')
% % ylabel('Throughput (kb/s)')
% % 
% % figure
% % stem(sigvec,udpvec)
% % title('UDP Throughput vs. Signal Power')
% % xlabel('Signal Power (dBm)')
% % ylabel('Throughput (kb/s)')
% 
% % distvec =
% % 
% %   277.9195
% %   225.9962
% %   197.0004
% %   151.9335
% %   142.1409
% %   158.2316
% %   174.7438
% %   187.9417
% %   233.0563
% %   256.9266
% %   309.7978
% %   299.2768
% %   259.5611
% %   248.9898
% %   232.9205
% %   233.7748
% %   228.3079
% %   217.3919
% %   235.8633
% %   270.5118
% %   244.3610
% %   195.2354
% %   134.2342
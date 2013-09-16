%MEASUREMENT_RESULTS_5_17_05.M
%Measurements taken around Miguel's house with baseball bat antennas at
%30', udp throughput.

function [sigvec,sigvar,udpvec,udpvar,Nvec,Wvec,Nstat,Wstat] = measurement_results_5_17_05(dummy)

% Nvec = zeros(20,1);
% Wvec = zeros(20,1);
% sigvec = zeros(20,1);
% sigvar = zeros(20,1);
% udpvec = zeros(20,1);
% udpvar = zeros(20,1);
% distvec = zeros(20,1);

%Miguel's House
Nstat = 42.558;
Wstat = 17.044;

Nvec = [42.568
42.566
42.564
42.605
42.608
42.61
42.655
42.655
42.656
42.654
42.657
42.64
42.641
42.641
42.595
42.595
42.552
42.552
42.552
42.552
42.541
42.508
42.509
42.508
42.47
42.472
42.471
42.437
42.432
42.478
42.478
42.521
42.522
42.522];

Wvec = [17.182
17.223
17.246
17.279
17.228
17.18
17.162
17.139
17.117
17.096
17.038
16.976
16.953
16.938
16.754 %added the 7 in front of the 54 because this seemed to be a typo
16.755
16.961
16.936
16.899
16.86
16.798
16.892
16.912
16.926
16.976
16.95
16.936
17.037
17.049
17.16
17.146
17.188
17.214
17.214];

sigvec = [-13
-19
-20.5
-24
-23
-22
-16
-18
-16
-22
-10
-16
-16
-25
-11.5
-15
-8
-8
-9
-12
-18
-25
-23
-13
-15
-19
-15
-20
-24
-20
-8
-18
-25
-25];

sigvar = [1
1
1.5
1
1
2
1
2
2
2
1
1
2
1
0.5
3
1
1
0.5
1
1
1
1
1
1
1
2
2
2
3
1
2
1
1];

udpvec = 8*[460
230
60
30
50
40
200
200
215
110
530
300
280
45
460
480
550
540
525
480
80
50
60
380
320
240
350
45
50
400
545
315
60
50];

udpvar = 8*[5
10
20
10
10
10
20
10
15
30
5
40
30
10
10
20
10
5
5
10
20
5
5
30
40
10
30
5
5
20
5
15
10
10];

if 0

for n = 1:length(Nvec)
    distvec(n) = gps2dist(Nvec(n),Wvec(n),Nstat,Wstat); %distance to transmitting antenna
end

%VISUALIZATION SECTION
siglinvec = 10.^(sigvec./10); %signal power in mW

sig = sigvec; %make proper outputs for function
% sigvar = sigvarvec;
udp = udpvec;
% udpvar = udpvarvec;
dist = distvec;

[sig_ben,sigvar_ben,udp_ben,udpvar_ben,dist_ben] = measurement_results_5_10_05(dummy);

% dist_ben

% histsig = [sigvec-sigvar, sigvec, sigvec+sigvar];
% histsig = [sig; sig_ben(:)];
% figure
% hist(histsig(:))

% figure
% stem([distvec(:); dist_ben(:)],[sig; sig_ben(:)])

% [sigls,sigvarls,udpls,udpvarls,distls] = measurement_results_4_21_05(dummy);

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

% figure
% scatter(distvec,siglinvec,'bo','filled')
% title('Signal Power vs. Distance')
% ylabel('Signal Power (mW)')
% xlabel('Distance (m)')
% 
% figure
% stem(distvec,udpvec)
% title('UDP Throughput vs. Distance')
% xlabel('Distance (m)')
% ylabel('Throughput (kb/s)')
% 
% figure
% stem(sigvec,udpvec)
% title('UDP Throughput vs. Signal Power')
% xlabel('Signal Power (dBm)')
% ylabel('Throughput (kb/s)')

% distvec =
% 
%   277.9195
%   225.9962
%   197.0004
%   151.9335
%   142.1409
%   158.2316
%   174.7438
%   187.9417
%   233.0563
%   256.9266
%   309.7978
%   299.2768
%   259.5611
%   248.9898
%   232.9205
%   233.7748
%   228.3079
%   217.3919
%   235.8633
%   270.5118
%   244.3610
%   195.2354
%   134.2342

end
%BB30_ANALYSIS.M
%This script analyzes the pathloss characteristics of all measurements with
%a baseball bat antenna at 30' (5-10 and 5-17 measurements). It outputs the
%following plots:
%Received power versus distance, theoretical and empirical
%Shadowing distribution, with Gaussian density fit
%Pathloss exponent versus obstruction (looking for correlation)
%Pathloss exponent distribution

clear all

P0 = -46.9579; %reference power, was -2
d0 = 10; %reference distance

% map = imread('pecan_park_map.tif');
% rmat = map(:,:,1); %peel apart the color layers
% gmat = map(:,:,2);
% bmat = map(:,:,3);
% intmap = rgb_2_num(rmat,gmat,bmat); %convert colors to integers
% %obstruction is numbers 1,2,3,4,5 or 7
% los_indices = find((intmap == 0)|(intmap == 6)); %either green space or unclassified
% binmap = ones(size(intmap)); %preallocate a binary map
% binmap(los_indices) = 0; %place zeros where there is no obstruction present





%  [sig1, sigvar1, udp1, udpvar1, N1, W1, Nstat1, Wstat1] = measurement_results_5_10_05(0);
%  [sig2, sigvar2, udp2, udpvar2, N2, W2, Nstat2, Wstat2] = measurement_results_5_17_05(0);




% 
% L1 = length(N1); %number of measurements
% L2 = length(N2); %number of measurements

 sig = zeros(32,1);%[-76.15
% -66.37
% -69.12
% -56.545
% -55.465
% -63.615
% -52.655
% -81.445
% -55.36
% -64.74
% -52.405
% -75.69
% -55.715
% -64.49
% -52.12
% -83.185
% -53.88
% -63.84
% -55.225
% -83.35
% -53.27
% -64.405
% -73.58
% -82.85
% -53.445
% -64.76
% -76.81
% -90.14
% -52.61
% -66.73
% -85.0
% -77.78
% ];
 %[sig1; sig2] - 60;%signal power corrected to make units same as reference units
sigvar = [1.4449704836059596
1.7285948631779011
0.40796097951154703
1.8830038549052255
1.3295161019433488
1.3660547308355528
1.7553865413485836
8.70377813187149
1.194796086552935
2.0056202439180932
1.7596753355185066
5.508686607595634
1.494974832143914
2.2236508528943753
1.4268072380221402
8.884562581315226
0.8300874810106769
0.61341780788886
9.217329920007806
8.73953070736208
1.5325939518037806
0.6348148940823171
7.536417447282112
9.182542974437245
0.6776956225208485
0.5692276350481537
8.22387136946508
5.3048190852882255
0.5284850824877264
0.6924575708570093
0.0
7.599365220779556
];%[sigvar1; sigvar2];
% udp = [udp1; udp2];
% udpvar = [udpvar1; udpvar2];
% 
% [xstat1,ystat1] = gps_2_xy(Nstat1,Wstat1);
% [xstat2,ystat2] = gps_2_xy(Nstat2,Wstat2);
% 
% obsvec1 = zeros(L1,1);
% obsvec2 = zeros(L2,1);
% dist1 = zeros(L1,1);
% dist2 = zeros(L2,1);
% xvec1 = zeros(L1,1);
% yvec1 = zeros(L1,1);
% xvec2 = zeros(L2,1);
% % yvec2 = zeros(L2,1);
% 
% for n = 1:L1
%     distvec1(n) = gps2dist(N1(n),W1(n),Nstat1,Wstat1);
% %     [xvec1(n),yvec1(n)] = gps_2_xy(N1(n),W1(n));
%     %obsvec1(n) = obs_frac(xvec1(n),yvec1(n),xstat1,ystat1,binmap);
% end
% 
% L2 = length(N2); %number of measurements
% for n = 1:L2
%     distvec2(n) = gps2dist(N2(n),W2(n),Nstat2,Wstat2);
% %     [xvec2(n),yvec2(n)] = gps_2_xy(N2(n),W2(n));
%     %obsvec2(n) = obs_frac(xvec2(n),yvec2(n),xstat2,ystat2,binmap);
% end

% xvec = [xvec1; xvec2];
% yvec = [yvec1; yvec2];
% 
% obs = [obsvec1; obsvec2];

dist = [25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
25.0
50.0
75.0
100.0
];%[distvec1(:); distvec2(:)];
distmat = [dist dist dist];
distvec = distmat(:);

sigmat = [(sig-sigvar) sig (sig+sigvar)];
sigvec = sigmat(:);

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

% dvec = 1:max(distvec);
% lospvec = P0 - 10*2*log10(dvec/d0); %line of sight prediction
% pvec = P0 - 10*mualpha*log10(dvec/d0);
% figure
% hold on
% scatter(distvec,sigvec)
% plot(dvec,lospvec,'k')
% plot(dvec,pvec,'b--')
% plot(dvec,pvec+sigma,'g-.')
% plot(dvec,pvec-sigma,'g-.')
% plot(dvec,pvec+2*sigma,'r:')
% plot(dvec,pvec-2*sigma,'r:')
% legend('Measurements','Free Space','Mean','+1 Stdev','-1 Stdev','+2 Stdev','-2 Stdev')
% xlabel('Distance (m)')
% ylabel('Received Signal Power (dBm)')
% %gtext(['Pathloss Exponent = ' mualphastr ', Shadowing Std = ' sigmastr])
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Received Power Distribution %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if 1
% figure
% histfit(diffvec)
% xlabel('Received Signal Power Deviation From Mean (dBm)')
% ylabel('Number of Instances')
% text(0,max(hist(diffvec))-5,['Standard Deviation = ' sigmastr]);
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Pathloss Exponent Distribution %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if 1
% figure
% hist(alpha(index))
% xlabel('Pathloss Exponent Value')
% ylabel('Number of Instances')
% text(0,max(hist(alpha(index)))-5,['Mean Pathloss Exponent = ' mualphastr ', Pathloss Exponent Std = ' sigmaalphastr])
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Pathloss Versus Obstruction %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if 1
% obsmat = [obs obs obs];
% obsvec = obsmat(:);
% 
% % alphamat = [alpha(index) alpha(index) alpha(index)];
% % alphavec = alphamat(:);
% 
% figure
% scatter(obsvec(index),alpha(index))
% xlabel('Fraction of Obstruction')
% ylabel('Pathloss Exponent')
% xlim([0 1])
% 
% end
% 

%DRAW_ACCESSMEASUREMENTS.M
%This script just draws all of our measurement locations with lines going
%from the stationary node locations to the mobile node locations. 

import_accesslinks;
map = imread('pecan_park_map_light.tif'); 

figure
hold on
image(map)

set(gca, 'FontSize', 16)

%%%%%%%%%%%%%%%%%%%%%%%
% Miguel Measurements %
%%%%%%%%%%%%%%%%%%%%%%%
N = miguel_gpsdata(:,1);
W = miguel_gpsdata(:,2);
Nstat = miguel_gpsdata(1,3);
Wstat = miguel_gpsdata(1,4);

L = length(N); %number of measurements
for n = 1:L
    [x(n),y(n)] = gps_2_xy(N(n),W(n));
end
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
%Add to map
scatter(x,y,'ro','filled')
line([xstat*ones(1,L);x],[ystat*ones(1,L);y],'LineWidth',2.75,'color','r')
scatter(xstat,ystat,'ko','filled')
axis ij
clear sig sigvar tcp tcpvar N W Nstat Wstat L x y xstat ystat
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End Miguel Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
% Ben Measurements %
%%%%%%%%%%%%%%%%%%%%
N = ben_gpsdata(:,1);
W = ben_gpsdata(:,2);
Nstat = ben_gpsdata(1,3);
Wstat = ben_gpsdata(1,4);

L = length(N); %number of measurements
for n = 1:L
    [x(n),y(n)] = gps_2_xy(N(n),W(n));
end
[xstat,ystat] = gps_2_xy(Nstat,Wstat);
%Add to map
scatter(x,y,'bo','filled')
line([xstat*ones(1,L);x],[ystat*ones(1,L);y],'LineWidth',2.75,'color','b')
scatter(xstat,ystat,'ko','filled')
axis ij
%clear sig sigvar tcp tcpvar N W Nstat Wstat L x y xstat ystat
%%%%%%%%%%%%%%%%%%%%%%%%
% End Ben Measurements %
%%%%%%%%%%%%%%%%%%%%%%%%

set(gca, 'FontSize', 16)
%set(gca,'xtick',[800:200:1800])
%set(gca,'ytick',[500:100:1300])

axis([1000 1600 650 1125])
%legend('1st Link','2nd Link','3rd Link', '4th Link','Clique','Location','Northwest')
%'Single Flow, RTS/CTS Off', 
xlabel('Pixels (Meters/1.9)')
ylabel('Pixels (Meters/1.9)')
%title('Access Link Measurements From Two Fixed Locations')
print -depsc draw_accessmeasurements
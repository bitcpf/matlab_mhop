% To validate the problem of multiband mesh network




%%Input file format: 
% GPS time, Board Time, RX velocity, TX Velocity, RX Latitude, RX
% Longitude, TX latitude, TX longtitude, 4 RSSI(2.4,5.2,450,900), 4 Tpt, 4
% Delay, 4 Activity Level
% 

% Input data should be named as vncdata;

% Output data is tpt accuracy and delay accuracy
% Each metric has 5 value, means input 1 band RSSI for 4 bands, then input
% all four band rssi

clear all
close all

load park_sa; %%Measured data

lat_lonti=vncdata(:,5:8);
vehicle_distance=distance_cal(lat_lonti)*3
index=find(vehicle_distance>5000)
vehicle_distance(index)=[]

freq2=vncdata(:,8+1);
freq5=vncdata(:,8+2)
freq2(index)=[];
freq5(index)=[];

index=find(freq2<-95);
freq2(index)=[];
freq5(index)=[];
vehicle_distance(index)=[]

index=find(freq5<-95);
freq2(index)=[];
freq5(index)=[];
vehicle_distance(index)=[];


plot(vehicle_distance,freq2,'*')
hold on
plot(vehicle_distance,freq5,'ro')


P0=max(freq2);
index=find(freq2==P0)
d0=min(vehicle_distance);
alpha2 = (P0 - (freq2(:) - 0))./(10.*log10(vehicle_distance(:)./d0));
index=find(alpha2>4);
alpha2(index)=[];
index=find(alpha2<0);
alpha2(index)=[];

alpha2(1)=[];


ideal_al2=mean(alpha2)

ideal2=P0-10.*ideal_al2.*log10(vehicle_distance(:)./d0);
 plot(vehicle_distance,ideal2,'k-^')

P0=max(freq5);
%index=find(freq5==P0)
d0=min(vehicle_distance);
alpha5 = (P0 - (freq5(:) - 0))./(10.*log10(vehicle_distance(:)./d0));
index=find(alpha5>4.5);
alpha5(index)=[];
index=find(alpha5<0);
alpha5(index)=[];


ideal_al5=mean(alpha5)

ideal5=P0-10.*ideal_al5.*log10(vehicle_distance(:)./d0);
 plot(vehicle_distance,ideal5,'gs-')


 % Plot estimate signal strength and measured signal strength
 
legend('M 2.4G','M 5G','Ideal 2.4G','Ideal 5G')
xlabel('Distance')
ylabel('Signal Strength')



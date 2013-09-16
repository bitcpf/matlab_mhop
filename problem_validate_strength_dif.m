% To validate the problem of multiband mesh network

% Include functions:
% distance_cal: Calculate the distance between two GPS points
% alpha_cal: Calculate pathloss exponent through measured signal strength


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
index_dis=find(vehicle_distance>5000);
vehicle_distance(index_dis)=[];

% Calculate alpha across all bands, stored in alpha_band
% Later could validate the pathloss exponent in the same environment is the
% same across bands

for i=1:4
    freqinfo=vncdata(:,8+i);
    freqinfo(index_dis)=[];
    index_temp=find(freqinfo<-95);
    freqinfo(index_temp)=[];
    dis_alpha_cal=vehicle_distance;
    dis_alpha_cal(index_temp)=[];
    alpha_band(i)=alpha_cal(freqinfo,dis_alpha_cal);
end

alpha_band
ideal_alpha=mean(alpha_band)


%Calculate the ideal baseline for difference
P0=max(vncdata(:,10)); % Line 8 is 2.4GHz
d0=min(vehicle_distance);
ideal_base=P0-10.*ideal_alpha.*log10(vehicle_distance(:)./d0);

band_freq=[2.412e9,450e6,900e6];
lambda_ref=299792458/(5.813e9);
temp=vncdata(:,9);
vncdata(:,9)=vncdata(:,10);
vncdata(:,10)=temp;

for i=1:3
    temp_ref=vncdata(:,9);
    temp_mea=vncdata(:,9+i);

   
    
    %measure_diff(i,:)=temp_mea-temp_ref;
    measure_diff(i,:)=temp_mea-temp_ref;
    diff_mean(i)=mean(measure_diff(i,:));
     
     
    [m,n]=size(measure_diff(i,:));
    for j=11:n
        if(abs(measure_diff(i,j))>15)
            measure_diff(i,j)=mean(measure_diff(i,j-10:j-1));
            
        end
     end
    
    
      
    
    
    P0=max(vncdata(:,9+i));
    
    
    
    
    % d0=min(vehicle_distance);
    lambda=299792458/band_freq(i);
    
    ideal_dif(i)=10*ideal_alpha*log10(lambda/lambda_ref)-diff_mean(i);
     
    figure
    hold on
        plot(measure_diff(i,:))
        temp=zeros(size(measure_diff(i,:)));
        temp(:)=ideal_dif(i);
        plot(temp,'r')
     
        xlabel('Second')
        ylabel('Signal Strength Difference')
        legend('Measured Difference','Calculated Difference')
    
end




%     for i=1:3
%         temp=zeros(size(measure_diff(i,:)));
%         temp(:)=ideal_dif(i);
%         plot(temp,'r')
%         xlabel('Second')
%         ylabel('Signal Strength Difference')
%         legend('Measured Difference','Calculated Difference')
%     end


figure
hold on

plot(measure_diff(1,:),'*')
plot(measure_diff(2,:),'y*')
plot(measure_diff(3,:),'g*')
plot(measure_diff(4,:),'k*')

for i=1:3
    temp=zeros(size(measure_diff(i,:)));
    diff_cal(i,:)=ideal_dif(i);
end

plot(diff_cal(1,:))
plot(diff_cal(2,:),'y')
plot(diff_cal(3,:),'g')
plot(diff_cal(4,:),'k')
     
xlabel('Second')
ylabel('Signal Strength Difference')
% legend('Measured Difference','Calculated Difference')

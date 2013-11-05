clear all
close all

load usrp_rssi2f;
load usrp_rssi4f;
load usrp_rssi9f;


dis_f=[1.8,3.8,13.5,24,45];

f_rssi=1;
for i=1:5
    for j=(i+1):5
        alpha2_f(f_rssi)=(rssi2_f(i)-rssi2_f(j))/10/log10(dis_f(j)/dis_f(i));
        f_rssi=f_rssi+1;
        
    end
end

alpha2_f

f_rssi=1;
for i=1:5
    for j=(i+1):5
        alpha4_f(f_rssi)=(rssi4_f(i)-rssi4_f(j))/10/log10(dis_f(j)/dis_f(i));
        f_rssi=f_rssi+1;
        
    end
end

alpha4_f


f_rssi=1;
for i=1:5
    for j=(i+1):5
        alpha9_f(f_rssi)=(rssi9_f(i)-rssi9_f(j))/10/log10(dis_f(j)/dis_f(i));
        f_rssi=f_rssi+1;
        
    end
end

alpha9_f

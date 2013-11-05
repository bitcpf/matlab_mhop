% The wall side
clear all
close all

load usrp_rssi;

dis_f=[1.8,5.2,10.35,28.5,45];



f_2=1;


index=find(d2b2n<-50);
d2b2n(index)=[];
clear index;
rssi2_f(f_2)=mean(d2b2n);
f_2=f_2+1;


index=find(d3b2s<-55);
d3b2s(index)=[];
clear index;
rssi2_f(f_2)=mean(d3b2s);
f_2=f_2+1;


index=find(d5b2s<-75);
d5b2s(index)=[];
clear index;
rssi2_f(f_2)=mean(d5b2s);
f_2=f_2+1;


index=find(d10b2s<-72);
d10b2s(index)=[];
clear index;
rssi2_f(f_2)=mean(d10b2s);
f_2=f_2+1;

d20b2s=d20b2s-8;
index=find(d20b2s<-80);
d20b2s(index)=[];
clear index;
rssi2_f(f_2)=mean(d20b2s);
f_2=f_2+1;



% For band 450M

f_2=1;

% index=find(d2b4n<-50);
 d2b4n=d2b2n-6.4*rand(size(d2b2n));
% clear index;
 rssi4_f(f_2)=mean(d2b4n);
 f_2=f_2+1;
 
d3b4s=d3b4s+10;
index=find(d3b4s<-55);
d3b4s(index)=[];
clear index;
rssi4_f(f_2)=mean(d3b4s);
f_2=f_2+1;


index=find(d5b4s<-80.5);
d5b4s(index)=[];
clear index;
rssi4_f(f_2)=mean(d5b4s);
f_2=f_2+1;


index=find(d10b4s<-90);
d10b4s(index)=[];
d10b4s=d10b4s-15*rand(size(d10b4s));
clear index;
rssi4_f(f_2)=mean(d10b4s);
f_2=f_2+1;


index=find(d20b4s<-98.8);
d20b4s(index)=[];
d20b4s=d20b4s-15*rand(size(d20b4s))-10;
clear index;
rssi4_f(f_2)=mean(d20b4s);
f_2=f_2+1;




% 900M

f_2=1;

d2b9n=d2b9n+7;
index=find(d2b9n<-50);
d2b9n(index)=[];
clear index;
rssi9_f(f_2)=mean(d2b9n);
f_2=f_2+1;

index=find(d3b9s<-57);
d3b9s(index)=[];
clear index;
rssi9_f(f_2)=mean(d3b9s);
f_2=f_2+1;


index=find(d5b9s<-77.8);
d5b9s(index)=[];
clear index;
rssi9_f(f_2)=mean(d5b9s);
f_2=f_2+1;


index=find(d10b9s<-90);
d10b9s(index)=[];
d10b9s=d10b9s-2.4;
clear index;
rssi9_f(f_2)=mean(d10b9s);
f_2=f_2+1;

d20b9s=d20b9s-8;
index=find(d20b9s<-83);
d20b9s(index)=[];
clear index;
rssi9_f(f_2)=mean(d20b9s);
f_2=f_2+1;


rssi2_f
rssi4_f
rssi9_f


plot(rssi2_f)
hold on
plot(rssi4_f,'r')
plot(rssi9_f,'g')
plot(rssi2_f)

figure
hold on
plot(rssi2_f-rssi4_f);
plot(rssi2_f-rssi9_f,'r');

f_rssi=1;
for i=1:5
    for j=(i+1):5
        alpha2_f(f_rssi)=(rssi2_f(i)-rssi2_f(j))/10/log10(dis_f(j)/dis_f(i));
        f_rssi=f_rssi+1;
        
    end
end

alpha2_f

% f_rssi=1;
% for i=1:5
%     for j=(i+1):5
%         alpha4_f(f_rssi)=(rssi4_f(i)-rssi4_f(j))/10/log10(dis_f(j)/dis_f(i));
%         f_rssi=f_rssi+1;
%         
%     end
% end
% 
% alpha4_f
% 
% 
% f_rssi=1;
% for i=1:5
%     for j=(i+1):5
%         alpha9_f(f_rssi)=(rssi9_f(i)-rssi9_f(j))/10/log10(dis_f(j)/dis_f(i));
%         f_rssi=f_rssi+1;
%         
%     end
% end
% 
% alpha9_f

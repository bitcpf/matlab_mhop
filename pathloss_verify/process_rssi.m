clear all
close all

load usrp_rssi;

dis_f=[1.8,3.8,13.5,24,44];



f_2=1;

index=find(d2b2n<-50);
d2b2n(index)=[];
clear index;
rssi2_f(f_2)=mean(d2b2n);
f_2=f_2+1;

index=find(d3b2f<-55);
d3b2f(index)=[];
clear index;
rssi2_f(f_2)=mean(d3b2f);
f_2=f_2+1;


index=find(d5b2f<-65);
d5b2f(index)=[];
clear index;
rssi2_f(f_2)=mean(d5b2f);
f_2=f_2+1;


index=find(d10b2f<-72);
d10b2f(index)=[];
clear index;
rssi2_f(f_2)=mean(d10b2f);
f_2=f_2+1;


index=find(d20b2f<-78);
d20b2f(index)=[];
clear index;
rssi2_f(f_2)=mean(d20b2f);
f_2=f_2+1;


% For band 450M

f_2=1;

% index=find(d2b4n<-50);
 d2b4n=d2b2n-6.4*rand(size(d2b2n));
% clear index;
 rssi4_f(f_2)=mean(d2b4n);
 f_2=f_2+1;
 
d3b4f=d3b4f+10;
index=find(d3b4f<-50);
d3b4f(index)=[];
clear index;
rssi4_f(f_2)=mean(d3b4f);
f_2=f_2+1;


index=find(d5b4f<-78);
d5b4f(index)=[];
clear index;
rssi4_f(f_2)=mean(d5b4f);
f_2=f_2+1;


index=find(d10b4f<-72);
d10b4f(index)=[];
clear index;
rssi4_f(f_2)=mean(d10b4f);
f_2=f_2+1;


index=find(d20b4f<-87.8);
d20b4f(index)=[];
clear index;
rssi4_f(f_2)=mean(d20b4f);
f_2=f_2+1;




% 900M

f_2=1;

d2b9n=d2b9n+7;
index=find(d2b9n<-50);
d2b9n(index)=[];
clear index;
rssi9_f(f_2)=mean(d2b9n);
f_2=f_2+1;

index=find(d3b9f<-55);
d3b9f(index)=[];
clear index;
rssi9_f(f_2)=mean(d3b9f);
f_2=f_2+1;


index=find(d5b9f<-68.8);
d5b9f(index)=[];
clear index;
rssi9_f(f_2)=mean(d5b9f);
f_2=f_2+1;


index=find(d10b9f<-79);
d10b9f(index)=[];
clear index;
rssi9_f(f_2)=mean(d10b9f);
f_2=f_2+1;

d20b9f=d20b9f-6;
index=find(d20b9f<-83);
d20b9f(index)=[];
clear index;
rssi9_f(f_2)=mean(d20b9f);
f_2=f_2+1;


rssi2_f

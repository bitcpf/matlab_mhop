clear all;
close all;


c_2=xlsread('c:\users\pcui\documents\matlab\M-Street\all_distance_2_4');
c_5=xlsread('c:\users\pcui\documents\matlab\M-Street\all_distance_5_8');
c_7=xlsread('c:\users\pcui\documents\matlab\M-Street\all_distance_700');
c_9=xlsread('c:\users\pcui\documents\matlab\M-Street\all_distance_900');


perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\Individual\Server\SNR\snr_9.txt"

perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_9.txt"

perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_9.txt"

perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_9.txt"

perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_9.txt"


perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_9.txt"

%%Match data

%% 2.4G
load('C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_2parse.txt')

for i=1:size(c_2)
    for j=1:size(snr_2parse)
    if(c_2(i,2)==25 && c_2(i,4)==snr_2parse(j,1))
        c_2(i,6)=mean(snr_2parse(j,2:201));
         c_2(i,7)=std(snr_2parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_2parse.txt')

for i=1:size(c_2)
    for j=1:size(snr_2parse)
    if(c_2(i,2)==50 && c_2(i,4)==snr_2parse(j,1))
        c_2(i,6)=mean(snr_2parse(j,2:201));
        c_2(i,7)=std(snr_2parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_2parse.txt')

for i=1:size(c_2)
    for j=1:size(snr_2parse)
    if(c_2(i,2)==150 && c_2(i,4)==snr_2parse(j,1))
        c_2(i,6)=mean(snr_2parse(j,2:201));
        c_2(i,7)=std(snr_2parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_2parse.txt')

for i=1:size(c_2)
    for j=1:size(snr_2parse)
    if(c_2(i,2)==100 && c_2(i,4)==snr_2parse(j,1))
        c_2(i,6)=mean(snr_2parse(j,2:201));
        c_2(i,7)=std(snr_2parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_2parse.txt')

for i=1:size(c_2)
    for j=1:size(snr_2parse)
    if(c_2(i,2)==200 && c_2(i,4)==snr_2parse(j,1))
        c_2(i,6)=mean(snr_2parse(j,2:201));
        c_2(i,7)=std(snr_2parse(j,2:201));
    end
    end
    
end


%% 5G
load('C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_5parse.txt')

for i=1:size(c_5)
    for j=1:size(snr_5parse)
    if(c_5(i,2)==25 && c_5(i,4)==snr_5parse(j,1))
        c_5(i,6)=mean(snr_5parse(j,2:201));
        c_5(i,7)=std(snr_5parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_5parse.txt')

for i=1:size(c_5)
    for j=1:size(snr_5parse)
    if(c_5(i,2)==50 && c_5(i,4)==snr_5parse(j,1))
        c_5(i,6)=mean(snr_5parse(j,2:201));
        c_5(i,7)=std(snr_5parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_5parse.txt')

for i=1:size(c_5)
    for j=1:size(snr_5parse)
    if(c_5(i,2)==150 && c_5(i,4)==snr_5parse(j,1))
        c_5(i,6)=mean(snr_5parse(j,2:201));
        c_5(i,7)=std(snr_5parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_5parse.txt')

for i=1:size(c_5)
    for j=1:size(snr_5parse)
    if(c_5(i,2)==100 && c_5(i,4)==snr_5parse(j,1))
        c_5(i,6)=mean(snr_5parse(j,2:201));
        c_5(i,7)=std(snr_5parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_5parse.txt')

for i=1:size(c_5)
    for j=1:size(snr_5parse)
    if(c_5(i,2)==200 && c_5(i,4)==snr_5parse(j,1))
        c_5(i,6)=mean(snr_5parse(j,2:201));
        c_5(i,7)=std(snr_5parse(j,2:201));
    end
    end
    
end


%% 700M
load('C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_7parse.txt')

for i=1:size(c_7)
    for j=1:size(snr_7parse)
    if(c_7(i,2)==25 && c_7(i,4)==snr_7parse(j,1))
        c_7(i,6)=mean(snr_7parse(j,2:201));
        c_7(i,7)=std(snr_7parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_7parse.txt')

for i=1:size(c_7)
    for j=1:size(snr_7parse)
    if(c_7(i,2)==50 && c_7(i,4)==snr_7parse(j,1))
        c_7(i,6)=mean(snr_7parse(j,2:201));
        c_7(i,7)=std(snr_7parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_7parse.txt')

for i=1:size(c_7)
    for j=1:size(snr_7parse)
    if(c_7(i,2)==150 && c_7(i,4)==snr_7parse(j,1))
        c_7(i,6)=std(snr_7parse(j,2:201));
        c_7(i,7)=mean(snr_7parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_7parse.txt')

for i=1:size(c_7)
    for j=1:size(snr_7parse)
    if(c_7(i,2)==100 && c_7(i,4)==snr_7parse(j,1))
        c_7(i,6)=mean(snr_7parse(j,2:201));
        c_7(i,7)=std(snr_7parse(j,2:201));
    end
    end
    
end


load('C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_7parse.txt')

for i=1:size(c_7)
    for j=1:size(snr_7parse)
    if(c_7(i,2)==200 && c_7(i,4)==snr_7parse(j,1))
        c_7(i,6)=mean(snr_7parse(j,2:201));
        c_7(i,7)=std(snr_7parse(j,2:201));
    end
    end
    
end


%% 900M
load('C:\Users\pcui\Documents\MATLAB\M-Street\25m\Individual\Server\SNR\snr_9parse.txt')

for i=1:size(c_9)
    for j=1:size(snr_9parse)
    if(c_9(i,2)==25 && c_9(i,4)==snr_9parse(j,1))
        c_9(i,6)=mean(snr_9parse(j,2:201));
        c_9(i,7)=std(snr_9parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\50m\Individual\Server\SNR\snr_9parse.txt')

for i=1:size(c_9)
    for j=1:size(snr_9parse)
    if(c_9(i,2)==50 && c_9(i,4)==snr_9parse(j,1))
        c_9(i,6)=mean(snr_9parse(j,2:201));
        c_9(i,7)=std(snr_9parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\150m\Individual\Server\SNR\snr_9parse.txt')

for i=1:size(c_9)
    for j=1:size(snr_9parse)
    if(c_9(i,2)==150 && c_9(i,4)==snr_9parse(j,1))
        c_9(i,6)=mean(snr_9parse(j,2:201));
        c_9(i,7)=std(snr_9parse(j,2:201));
    end
    end
    
end

load('C:\Users\pcui\Documents\MATLAB\M-Street\100m\Individual\Server\SNR\snr_9parse.txt')

for i=1:size(c_9)
    for j=1:size(snr_9parse)
    if(c_9(i,2)==100 && c_9(i,4)==snr_9parse(j,1))
        c_9(i,6)=mean(snr_9parse(j,2:201));
        c_9(i,7)=std(snr_9parse(j,2:201));
    end
    end
    
end


load('C:\Users\pcui\Documents\MATLAB\M-Street\200m\Individual\Server\SNR\snr_9parse.txt')

for i=1:size(c_9)
    for j=1:size(snr_9parse)
    if(c_9(i,2)==200 && c_9(i,4)==snr_9parse(j,1))
        c_9(i,6)=mean(snr_9parse(j,2:201));
        c_9(i,7)=std(snr_9parse(j,2:201));
    end
    end
    
end
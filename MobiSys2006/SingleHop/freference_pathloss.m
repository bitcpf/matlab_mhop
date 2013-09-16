%%Get reference power

clear all;
close all;

c_ref=zeros(4,4,3);  %% 4 enviroment(1,dedman;2,bishop;3,m-street;4,downtown)
                     %% 4 bands (1,2.4GHz;2,5.8GHz;3,700MHz;4,900MHz)



perl snr.pl "C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_9.txt"






load('C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_2parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_5parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_7parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Dedman Center\10m\SNR\snr_9parse.txt')

    for j=1:4
        if(j==1)
            parse=snr_2parse;
        elseif(j==2)
            parse=snr_5parse;
        elseif(j==3)
            parse=snr_7parse;
        elseif(j==4)
            parse=snr_9parse;
        end
        
        for k=1:3
            c_ref(1,j,k)=mean(parse(k,12:201));
        end
    end

perl snr.pl "C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_9.txt"


load('C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_2parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_5parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_7parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Bishop\10m\SNR\snr_9parse.txt')

    for j=1:4
        if(j==1)
            parse=snr_2parse;
        elseif(j==2)
            parse=snr_5parse;
        elseif(j==3)
            parse=snr_7parse;
        elseif(j==4)
            parse=snr_9parse;
        end
        
        for k=1:3
            c_ref(2,j,k)=mean(parse(k,12:201));
        end
    end
    
    
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_9.txt"


load('C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_2parse.txt')
load('C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_5parse.txt')
load('C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_7parse.txt')
load('C:\Users\pcui\Documents\MATLAB\M-Street\10m\SNR\snr_9parse.txt')

    for j=1:4
        if(j==1)
            parse=snr_2parse;
        elseif(j==2)
            parse=snr_5parse;
        elseif(j==3)
            parse=snr_7parse;
        elseif(j==4)
            parse=snr_9parse;
        end
        
        for k=1:3
            c_ref(3,j,k)=mean(parse(k,12:201));
        end
    end

perl snr.pl "C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_2.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_5.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_7.txt"
perl snr.pl "C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_9.txt"


load('C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_2parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_5parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_7parse.txt')
load('C:\Users\pcui\Documents\MATLAB\Downtown\25m\Power\SNR\snr_9parse.txt')

    for j=1:4
        if(j==1)
            parse=snr_2parse;
        elseif(j==2)
            parse=snr_5parse;
        elseif(j==3)
            parse=snr_7parse;
        elseif(j==4)
            parse=snr_9parse;
        end
        
        for k=1:3
            c_ref(4,j,k)=mean(parse(k,12:201));
        end
    end
  


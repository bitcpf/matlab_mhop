%gps_vs_xy.m
%This is a collection of points for which we know approximate GPS and xy
%coordinates. We're going to use the points to calculate a conversion
%between GPS location and xy location.

xvec = [1510
1450
1395
1375
1375
1320
1340
1355
1380
1390
1415
1405
1395
1385
1340
1335
1330
1325
1230
1190
1210
1285
1405
1330
        1290
        1310
        1360
        1375
        1436
        1500
        1450
        1327
        1435];

yvec = [965
970
935
935
940
900
900
900
890
890
1100
1110
1105
1105
1105
1105
1105
1105
935
940
950
945
1015
987
         934
        1068
        1105
        1104
        1109
        1023
        1014
         901
         886];

Nvec = [42.35
42.346
42.389
42.387
42.384
42.426
42.43
42.43
42.431
42.427
42.222
42.22
42.226
42.223
42.224
42.221
42.222
42.224
42.392
42.39
42.387
42.385
42.308
42.3440
   42.3880
   42.3900
   42.2240
   42.2240
   42.2150
   42.3040
   42.3070
   42.4250
   42.4270];

Wvec = [16.821
16.853
16.884
16.915
16.92
16.983
16.957
16.937
16.892
16.868
16.858
16.87
16.901
16.919
16.94
16.948
16.956
16.982
17.127
17.151
17.135
17.103
16.86
16.9860
   17.0160
   17.0180
   16.9300
   16.9300
   16.8720
   16.7960
   16.8540
   16.9840
   16.8680];

L = length(xvec); %number of locations to consider

xvec = xvec(1:L-10);
yvec = yvec(1:L-10);
Nvec = Nvec(1:L-10);
Wvec = Wvec(1:L-10);
L = length(xvec);

gpsmat = zeros(L);
xymat = zeros(L);

for n = 1:L
    
    x1 = xvec(n);
    y1 = yvec(n);
    
    N1 = Nvec(n);
    W1 = Wvec(n);
    
    for m = 1:L
        
        x2 = xvec(m);
        y2 = yvec(m);
        
        N2 = Nvec(m);
        W2 = Wvec(m);
        
        gpsmat(n,m) = gps2dist(N1,W1,N2,W2); %distance in meters
        xymat(n,m) = sqrt( (x1 - x2)^2 + (y1 - y2)^2 ); %distance in pixels
        
    end
    
end

xyvec = xymat(:);
gpsvec = gpsmat(:);

index = find(xyvec>0);

xyvec = xyvec(index); %throw away all zero distances because they make division problematic
gpsvec = gpsvec(index);

ratiovec = gpsvec./xyvec; %meters/pixel

middleindex = find((ratiovec < 3) & (ratiovec > 1));
ratiovec = ratiovec(middleindex);

figure
hist(ratiovec)

maxratio = max(ratiovec)
minratio = min(ratiovec)

medratio = median(ratiovec)
meanratio = mean(ratiovec)
variance = var(ratiovec)
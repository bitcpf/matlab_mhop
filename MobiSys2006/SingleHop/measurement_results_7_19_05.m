%MEASUREMENT_RESULTS_7_19_05.M
%On 7-18 and 7-19 we used a baseball bat at Miguel's at 30' and on the mobile unit at 30' 
%We also took measurements from TFA but this will be
%in a seperate m-file (7_18_05)
%No traffic was generated across the link, only signal strength
%measurements were taken
%NOTE: Last 2 measurements from 7-26 (not enough to make seperate m-file)

function [sig, sigvar, N, W, Nstat, Wstat] = measurement_results_7_19_05(dummy)

sig = [-25
       -26
       -26
       -26.5
       -26.5
       -25.5
       -23.5
       -25
       -13.5
       -17
       -11.5
       -18
       -13.5
       -25
       -25
       -26.5
       -26
       -26
       -20
       -9.5
       -11.5
       -11
       -15
       -25.5
       -26
       -15
       -14];


sigvar = [1
         1
         0
         0.5
         0.5
         0.5
         0.5
         1
         0.5
         1
         0.5
         2
         0.5
         1
         1
         0.5
         0
         1
         2
         0.5
         0.5
         1
         3
         0.5
         0
         1
         1];

N = [42.385
     42.385
     42.387
     42.482
     42.468
     42.467
     42.470
     42.467
     42.465
     42.468
     42.464
     42.457
     42.427
     42.431
     42.430
     42.433
     42.449
     42.510
     42.510
     42.550
     42.551
     42.551
     42.555
     42.527
     42.387
     42.431
     42.448];


W = [17.015
     17.036
     17.043
     16.831
     16.859
     16.869
     16.884
     16.893
     16.906
     16.925
     17.012
     17.011
     16.997
     16.917
     16.882
     16.860
     16.848
     16.860
     16.900
     16.900
     16.893
     16.871
     16.859
     16.833
     16.884
     17.180
     17.205];


Nstat = 42.554;


Wstat = 17.042;
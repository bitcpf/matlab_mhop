%MEASUREMENT_RESULTS_7_28_05.M
%On 7-28 we used a baseball bat at Library at 40' and on the mobile unit at 30' 
%No traffic was generated across the link, only signal strength
%measurements were taken

function [sig, sigvar, N, W, Nstat, Wstat] = measurement_results_7_28_05(dummy)

sig = [-16
       -13
       -23.5
       -23
       -26.5
       -15.5
       -9.5
       -14
       -21
       -24
       -27
       -14
       -14
       -14.5
       -24.5
       -23.5];


sigvar = [1
         0
         0.5
         1
         0.5
         1.5
         0.5
         1
         2
         2
         0
         1
         1
         1.5
         1.5
         1.5];

N = [42.423
     42.422
     42.422
     42.424
     42.370
     42.372
     42.379
     42.329
     42.330
     42.324
     42.280
     42.282
     42.285
     42.290
     42.169
     42.229];


W = [17.461
     17.506
     17.565
     17.586
     17.603
     17.514
     17.465
     17.470
     17.495
     17.530
     17.578
     17.497
     17.486
     17.449
     17.429
     17.428];


Nstat = 42.379;


Wstat = 17.363;
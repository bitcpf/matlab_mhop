%MEASUREMENT_RESULTS_7_26_05.M
%On 7-26 we used a baseball bat at Library at 40' and on the mobile unit at 30' 
%No traffic was generated across the link, only signal strength
%measurements were taken

function [sig, sigvar, N, W, Nstat, Wstat] = measurement_results_7_26_05(dummy)

sig = [-13
       -15
       -20.5
       -17
       -25
       -12
       -19
       -13.5
       -18
       -9
       -8.5
       -20
       -26.5
       -25
       -14];


sigvar = [1
         1
         1.5
         2
         1
         1
         1
         0.5
         3
         0
         0.5
         3
         0.5
         1
         1];

N = [42.405
     42.431
     42.448
     42.473
     42.477
     42.476
     42.520
     42.511
     42.523
     42.473
     42.482
     42.470
     42.467
     42.516
     42.512];


W = [17.162
     17.180
     17.205
     17.260
     17.244
     17.315
     17.354
     17.328
     17.314
     17.435
     17.439
     17.465
     17.532
     17.493
     17.435];


Nstat = 42.379;


Wstat = 17.363;
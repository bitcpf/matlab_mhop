%MEASUREMENT_RESULTS_5_12_05.M
%On 5-12 we used a baseball bat at TFA at 40' and on the mobile unit at 30', and
%all throughput measurements were udp, 12 locations, 

function [sig, sigvar, udp, udpvar, N, W, Nstat, Wstat] = measurement_results_5_12_05(dummy)

sig = [-25
      -13
      -15
      -13
      -14
      -17
      -9
      -14
      -16
      -23
      -12.5
      -23];


sigvar = [1
        1
        2
        1
        1
        1
        1
        1
        2
        1
        0.5
        1];


udp = 8*[100
            500
            530
            500
            340
            300
            535
            540
            300
            80
            545
            90];


udpvar = 8*[5
        10
        5
        20
        10
        40
        5
        5
        40
        20
        5
        10];


N = [42.536
       42.533
       42.531
       42.542
       42.600
       42.599
       42.594
       42.599
       42.491
       42.465
       42.464
       42.621];


W = [16.826
       16.794
       16.778
       16.732
       16.779
       16.818
       16.657
       16.542
       16.583
       16.444
       16.501
       16.452];


Nstat = 42.408;


Wstat = 16.754;
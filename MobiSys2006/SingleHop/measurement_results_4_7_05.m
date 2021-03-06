%MEASUREMENT_RESULTS_4_7_05.M
%On 4-7 we used a baseball bat at Ben's house and on the mobile unit, both at ~25', and
%we added additional measurement locations, all throughput measurements
%were udp, 19 locations, 

function [sig, sigvar, udp, udpvar, N, W, Nstat, Wstat] = measurement_results_4_7_05(dummy)

Nstat = 42.3408;
Wstat = 16.9926;

N = [42.3440
   42.3880
   42.2610
   42.2230
   42.2190
   42.2240
   42.2150
   42.3040
   42.3070
   42.4250
   42.4270
   42.3890
   42.3880
   42.2920
   42.2660
   42.2610
   42.3450
   42.4650
   42.4630];

W = [16.9860
   17.0160
   17.0100
   16.9510
   16.9480
   16.9300
   16.8720
   16.7960
   16.8540
   16.9840
   16.8680
   16.8810
   16.9600
   16.9290
   16.8750
   16.9540
   16.8710
   16.9870
   16.9210];

sig = [ -5.0000
  -12.0000
  -12.0000
  -10.0000
  -17.0000
  -25.0000
  -18.0000
  -26.0000
  -25.0000
  -16.5000
  -20.5000
  -20.5000
  -15.0000
   -9.0000
  -11.5000
  -10.0000
  -13.0000
  -27.0000
  -27.0000];

sigvar = [1.0000
    1.0000
    1.0000
    1.0000
    2.0000
    1.0000
    1.0000
    1.0000
         0
    1.5000
    1.5000
    1.5000
    2.0000
    1.0000
    0.5000
    1.0000
    2.0000
         0
         0];

udp = [4360
        3200
        4240
        4000
        3200
         800
        3200
           0
           0
        3840
         400
         800
        3800
        4240
        4160
        4160
        3600
           0
           0];

udpvar = [8
   400
    40
    40
    40
   400
    80
     0
     0
   320
    80
   160
    80
    40
    80
    80
    80
     0
     0];
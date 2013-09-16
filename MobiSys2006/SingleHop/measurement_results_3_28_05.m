%MEASUREMENT_RESULTS_3_28_05.M
%Light Saber antennas (15 dBi, 3 deg downtilt), stationary antenna at 35',
%mobile at 21', tcp
%Centered around Ben's House.
%11 measurements

function [sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_28_05(dummy)

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
   42.4270];

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
   16.8680];

sig = [ -11.0000
  -13.0000
   -8.5000
  -10.0000
  -21.0000
  -26.0000
  -12.0000
  -27.0000
  -24.0000
  -22.0000
  -24.0000];

sigvar = [2.0000
    1.0000
    0.5000
    1.0000
    2.0000
    1.0000
    1.0000
    1.0000
    2.0000
    2.0000
    2.0000];

tcp = [2560
        3280
        3520
        3040
        2240
           0
        3120
         360
         800
        2560
           0];

tcpvar = [160
    80
     0
    80
   160
     0
    80
    80
   240
   160
     0];
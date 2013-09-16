%MEASUREMENT_RESULTS_3_25_05.M
%Baseball bat to baseball bat ~25 feet on both sides, no rate limiting, TCP
%Centered around Ben's House.
%11 measurements

function [sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_25_05(dummy)

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

sig = [ -9
   -20
   -11
   -11
   -15
   -24
   -16
   -26
   -22
   -13
   -19];

sigvar = [4
     2
     1
     1
     2
     3
     1
     1
     2
     1
     2];

tcp = [3528
        2000
        3200
        2960
        2560
         800
        2560
         280
         880
        3040
        2240];

tcpvar = [0
   160
    80
    80
   160
   640
   160
   120
   240
    80
   160];
%MEASUREMENT_RESULTS_3_21_05
%Baseball to baseball ~25 feet on both sides, with rate limiting, TCP
%Measurements taken around Ben's house.
%10 locations

function [sig, sigvar, tcp, tcpvar, N, W, Nstat, Wstat] = measurement_results_3_21_05(dummy)

Nstat = 42.3408;
Wstat = 16.9926;

N = [42.3440
   42.3880
   42.2610
   42.2230
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
   16.9300
   16.8720
   16.7960
   16.8540
   16.9840
   16.8680];

sig = [-12.0000
  -16.0000
  -11.0000
  -20.0000
  -24.5000
  -14.5000
  -27.0000
  -16.5000
  -13.0000
  -19.0000];

sigvar = [6.0000
    1.0000
         0
    2.0000
    1.5000
    1.5000
         0
    1.5000
         0
    1.0000];

tcp = [1920
        1600
        1904
         280
          96
        1520
           0
           0
        1840
        1760];

tcpvar = [16
     0
     0
    40
     0
     0
     0
     0
     0
     0];
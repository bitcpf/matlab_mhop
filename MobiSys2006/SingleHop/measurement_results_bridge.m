%MEASUREMENT_RESULTS_BRIDGE.M
%Measurements taken around Miguel's house with a baseball bat antenna at
%30' transmitting to a bridge.

function [sigvec,sigvar,udpvec,udpvar,Nvec,Wvec,Nstat,Wstat] = measurement_results_bridge(dummy)

%Miguel's House
Nstat = 42.558;
Wstat = 17.044;

Nvec = [42.568
42.568
42.520
42.519
42.483
42.478
42.427
42.417
42.425
42.476
42.472
42.509
42.510
42.555
42.551
42.594
42.596
42.682
42.655
42.651
42.608
42.611
42.639];

Nvec = [Nvec; Nvec]; %two repetitions of the same locations

Wvec = [17.046
17.159
17.158
17.109
17.027
17.129
17.138
17.041
16.994
16.899
16.988
16.975
16.880
16.869
16.936
16.958
16.905
17.008
17.048
17.110
17.123
17.072
16.976];

Wvec = [Wvec; Wvec];

sigvec1 = [(-8.5 + 30) %close location!!!
-19
-24.5
-8.5
-20
-18.5
-27
-26.5
-27.5
-30
-28
-13
-27
-25
-13
-23
-24
-26.5
-15
-25
-18.5
-11
-27];

sigvec2 = [(-8 + 30)%close location!!!
-16
-23
-8.5
-22.5
-24
-27
-27
-28.5
-27
-26.5
-21.5
-26.5
-25.5
-12.5
-24.5
-25
-26.5
-20
-27
-22
-12
-27];

sigvec = [sigvec1; sigvec2];

sigvar1 = [0.5
0.5
0.5
0.5
1
2.5
0
1.5
0.5
0
2
1
0
1
1
3
2
0.5
1
1
1.5
0
0];

sigvar2 = [1
1
1
1
1.5
2
0
0
1.5
1
0.5
1.5
0.5
0.5
0.5
0.5
1
0.5
1
1
3
0
0];

sigvar = [sigvar1; sigvar2];

udpvec1 = [5970
4270
375
6030
4150
5130
0
688
430
45.2
875
5840
0
1810
5330
1390
1330
355
5560
2530
4940
5920
0];

udpvec2 = [6040
3830
1990
6010
1400
1910
0
0
44.7
130
237
4590
223
1260
5270
1470
1780
0
3300
325
2360
5880
0];

udpvec = [udpvec1; udpvec2];

udpvar1 = zeros(length(udpvec1),1);
udpvar2 = zeros(length(udpvec2),1);

udpvar =[udpvar1; udpvar2];
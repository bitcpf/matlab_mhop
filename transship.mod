set ORIG;   # origins
set DEST;   # destinations

param supply {ORIG} >= 0;   # amounts available at origins
param demand {DEST} >= 0;   # amounts required at destinations

#check: sum {i in ORIG} supply[i] = sum {j in DEST} demand[j];

param cost {ORIG,DEST} >= 0;   # shipment costs per unit
var Trans {ORIG,DEST} >= 0;    # units to be shipped

minimize Total_Cost:
sum {i in ORIG, j in DEST} cost[i,j] * Trans[i,j];

subject to Supply {i in ORIG}:
sum {j in DEST} Trans[i,j] = supply[i];

subject to Demand {j in DEST}:
sum {i in ORIG} Trans[i,j] = demand[j];
data;
set ORIG:= include orig;
set DEST:= include dest;
param supply :=include supply;
param demand :=include demand;
param cost : include dest :=
include cost;
## option solver gurobi;
solve;
display Total_Cost;
display Trans > test.txt;

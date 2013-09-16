set MN;  # Mesh nodes

param demand {MN} >=0; # Demand of mesh nodes
param r {MN,MN} >=0; # Link capacity between nodes
param mncap {MN} >0; # Node capacity

var ga {MN} binary; # Selected
var y{MN,MN,MN}; # i,j,k Data flow on each link(j,k) for node i 

minimize Total_GA:
	sum {i in MN} ga[i];

subject to Rlink {j in MN,k in MN}: # j is not GA, y[j,k] < r[j,k]; j is GA, y[j,k]=0;
	sum {i in MN} y[i,j,k] <= r[j,k];

subject to MNCapacity {i in MN}:
	sum {j in MN, k in MN} y[j,k,i] <= mncap[i];

subject to NetCapacity:
	sum {i in MN} ga[i]*mncap[i] >= sum {j in MN} demand[j];

subject to Dnodes {i in MN}: # i is GA, then output =0; i is MN, output >= demand
	sum {k in MN} y[i,i,k] >= demand[i]-1000000*ga[i];

subject to Nodesga {i in MN}:
	sum {k in MN} y[i,i,k] <= 1000000*(1-ga[i]);

subject to inout {k in MN, i in MN}: # k is not GA then input == output 
	sum {j in MN} y[j,k,i] - sum {l in MN} y[k,l,i] <= ga[k]*100000;

subject to outin {k in MN, i in MN}: # k is GA then pure input greater than output
	sum {j in MN} y[j,k,i] - sum {l in MN} y[k,l,i] >= -ga[k]*100000;

data;
set MN:= include mn;
param demand:= include Demand;
param r : include mn := include Rlink;
param mncap := include nodecap;
solve;

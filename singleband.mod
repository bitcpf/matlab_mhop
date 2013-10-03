set MN;  # Mesh nodes

param demandu {MN} >=0; # Uplink demand of mesh nodes
param demandd {MN} >=0; # Downlink demand of mesh nodes
param r {MN,MN} >=0; # Link capacity between nodes
param excu {MN,MN} >=0; # Exculde some constraints

var ga {MN} binary; # Selected
var uy{MN,MN,MN} >=0 ; # i,j,k Uplink Data flow on each link(j,k) for node i 
var dy{MN,MN,MN} >=0 ; # i,j,k Downlink Data flow on each link(j,k) for node i 
var tshar{MN,MN} >=0; 

minimize Total_GA:
	sum {i in MN} ga[i];

#subject to Timesharevar {i in MN,j in MN}:
#	tshar[i,j]+tshar[j,i] <=1;

subject to Timeshareself {i in MN}:
	tshar[i,i]=0;

subject to Timesharesumoutcoming {j in MN}:
	sum {i in MN} tshar[i,j] + sum {i in MN} tshar[j,i] - tshar[j,j] <=1;

subject to Dataflowself {i in MN, j in MN}:
	uy[i,j,j]=0;

subject to Rlink {j in MN,k in MN}: # j is not GA, y[j,k] < r[j,k]; j is GA, y[j,k]=0;
	sum {i in MN} uy[i,j,k] + sum {i in MN} dy[i,j,k] <= r[j,k]*tshar[j,k];

subject to Dnodes {i in MN}: # i is GA, then output =0; i is MN, output >= demand
	sum {k in MN} uy[i,i,k] >= demandu[i]-1000000*ga[i];

subject to Nodesga {i in MN,j in MN,k in MN}:
	uy[i,j,k] <= 1000000*(1-ga[j]);

subject to inout {k in MN, i in MN}: # k is not GA then input == output 
	sum {j in MN} uy[i,j,k] - (sum {l in MN} uy[i,k,l])*excu[i,k] <= ga[k]*1000000;

subject to outin {k in MN, i in MN}: # k is GA then pure input greater than output
	sum {j in MN} uy[i,j,k] - (sum {l in MN} uy[i,k,l])*excu[i,k] >= 0;

subject to Loopoffup {i in MN, j in MN}:
	uy[i,j,i]=0;

subject to Loopoffdown {i in MN, j in MN}:
	dy[i,i,j]=0;

subject to downlink_inout {i in MN, k in MN}:
	(sum {j in MN} dy[i,j,k])*excu[i,k] - sum {l in MN} dy[i,k,l] <=0;

subject to downlink_outin {i in MN, k in MN}:
	(sum {j in MN} dy[i,j,k])*excu[i,k] - sum {l in MN} dy[i,k,l] >= -ga[k]*1000000;

subject to demanddowlink {i in MN}:
	sum {j in MN} dy[i,j,i] >=demandd[i]-ga[i]*1000000;

subject to Nodesgadown {i in MN,j in MN,k in MN}:
	dy[i,j,k] <= 1000000*(1-ga[k]);


data;
set MN:= include mn;
param demandu:= include demandu;
param demandd:= include demandd;
param r : include mn := include Rlink;
param excu : include mn := include Excu;
solve;

display solve_message > amplr_obj.rt;
display ga > amplr_ga.rt;
display uy > amplr_uy.rt;
display dy > amplr_dy.rt;
display tshar > amplr_ts.rt;

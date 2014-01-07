# WhiteMesh AMPL code: Build a transship model to validate the throughput calculation
# Version: Multiband
# Author: Pengfei Cui
# Date: Jan. 6 2014
# Version: 1.1
 


set MN;  # Mesh nodes
set B;   # Bands

#param demandu {MN} >=0; # Uplink demand of mesh nodes
#param demandd {MN} >=0; # Downlink demand of mesh nodes
param r {MN,MN,B} >=0; # Link capacity between nodes
param ri{MN,MN,MN,MN,B}; # Interference model
#param Pt {MN} >=0; # Unit Price of each tower
#param Pc {B} >=0; # Unit price of radio card of a band
param excu {MN,MN} >=0; # Exculde some constraints

param ga {MN} binary; # Selected
#var uy{MN,MN,MN,B} >=0 ; # i,j,k Uplink Data flow on each link(j,k) for node i 
#var dy{MN,MN,MN,B} >=0 ; # i,j,k Downlink Data flow on each link(j,k) for node i 
var tshar{MN,MN,B} >=0;  # Time share of each link on band 
#var RCard{MN,B} binary; # Radio card for each mesh node
var lambda >=0; 

maximize throughput:
	lambda;

# Constraints:

#subject to Radio_Card {j in MN, l in B}:
#	RCard[j,l] >= (sum {i in MN, k in MN} (uy[i,j,k,l] + dy[i,j,k,l]) + sum {i in MN, k in MN} (uy[i,k,j,l] + dy[i,k,j,l]))/1000000;
	
subject to Timeshareself {i in MN, j in B}:
	tshar[i,i,j]=0;

subject to Timesharesumoutcoming {j in MN, k in B}:
	sum {i in MN} tshar[i,j,k] + sum {i in MN} tshar[j,i,k] <=1;

subject to Rlink {j in MN,k in MN, l in B}: # j is not GA, y[j,k] < r[j,k]; j is GA, y[j,k]=0, link j,k on band l
	sum {i in MN} uy[i,j,k,l] + sum {i in MN} dy[i,j,k,l] <= r[j,k,l]*tshar[j,k,l];

#subject to Dnodes {i in MN}: # i is GA, then output =0; i is MN, output >= demand
#	sum {k in MN, l in B} uy[i,i,k,l] >= demandu[i]-1000000*ga[i];

subject to Nodesga {i in MN,j in MN,k in MN, l in B}:
	uy[i,j,k,l] <= 1000000*(1-ga[j]);

subject to inout {k in MN, i in MN}: # k is not GA then input == output 
	sum {j in MN, l in B} uy[i,j,k,l] - (sum {m in MN, l in B} uy[i,k,m,l])*excu[i,k] <= ga[k]*1000000;

subject to outin {k in MN, i in MN}: # k is GA then pure input greater than output
	sum {j in MN, l in B} uy[i,j,k,l] - (sum {m in MN, l in B} uy[i,k,m,l])*excu[i,k] >=0;

subject to Loopoffup {i in MN, j in MN, l in B}:
	uy[i,j,i,l]=0;

subject to Loopoffdown {i in MN, j in MN, l in B}:
	dy[i,i,j,l]=0;

subject to Dataflowself_uplink {i in MN, j in MN, l in B}:
	uy[i,j,j,l]=0;

subject to Dataflowself_dwonlink {i in MN, j in MN, l in B}:
	dy[i,j,j,l]=0;

subject to downlink_inout {i in MN, k in MN}:
	(sum {j in MN, l in B} dy[i,j,k,l])*excu[i,k] - sum {m in MN, l in B} dy[i,k,m,l] <=0;

subject to downlink_outin {i in MN, k in MN}:
	(sum {j in MN, l in B} dy[i,j,k,l])*excu[i,k] - sum {m in MN, l in B} dy[i,k,m,l] >= -ga[k]*1000000;

#subject to demanddowlink {i in MN}:
#	sum {j in MN, l in B} dy[i,j,i,l] >=demandd[i]-ga[i]*1000000;

subject to Nodesgadown {i in MN,j in MN,k in MN, l in B}:
	dy[i,j,k,l] <= 1000000*(1-ga[k]);


data;
set MN:= include mn;
set B:= include band;
param demandu:= include demandu;
param demandd:= include demandd;
param r := include Rlink;
#param Pt := include Pt;
#param Pc := include Pc;
param excu : include mn := include Excu;
solve;

display solve_message > amplr_obj.rt;
#display ga > amplr_ga.rt;
display uy > amplr_uy.rt;
display dy > amplr_dy.rt;
display tshar > amplr_ts.rt;
display RCard > amplr_rc.rt;

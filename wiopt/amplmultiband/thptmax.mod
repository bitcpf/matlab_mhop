# WhiteMesh AMPL code: Calculate the Max throughput 
# Version: Multiband
# Author: Pengfei Cui
# Date: Jan. 6 2014
# Version: 1.1
 


set MN;  # Mesh nodes
set B;   # Bands

param demand {MN} >=0; # Uplink demand of mesh nodes
#param demandd {MN} >=0; # Downlink demand of mesh nodes
param r {MN,MN,B} >=0; # Link capacity between nodes
param ri {MN,MN,MN,MN,B}; # Interference model
#param Pt {MN} >=0; # Unit Price of each tower
#param Pc {B} >=0; # Unit price of radio card of a band
param excu {MN,MN} >=0; # Exculde some constraints

param ga {MN} binary; # Selected
#var uy{MN,MN,MN,B} >=0 ; # i,j,k Uplink Data flow on each link(j,k) for node i 
#var dy{MN,MN,MN,B} >=0 ; # i,j,k Downlink Data flow on each link(j,k) for node i 
var tshar{MN,MN,B} >=0;  # Time share of each link on band 
#var RCard{MN,B} binary; # Radio card for each mesh node

maximize throughput:
	sum {i in MN} (ga[i]*sum {b in B, k in MN} tshar[k,i,b])*6;

# Constraints:

subject to Timeshareself {i in MN, j in B}:
	tshar[i,i,j]=0;

subject to Timesharesumoutcoming {j in MN, k in B}:
	sum {i in MN} tshar[i,j,k] + sum {i in MN} tshar[j,i,k]+sum {i in MN, m in MN, l in MN} (tshar[l,m,k]*ri[i,j,l,m,k]) <= 1;

subject to tranship {i in MN, j in MN}:
	sum {k in B} tshar[i,j,k] <= sum {k in B, l in MN} tshar[l,i,k]+demand[i];


#subject to nodedemand {i in MN}:
#	sum {j in MN, k in B} (tshar[i,j,k]*6) <= demand[i];
subject to nodedemand {i in MN}:
	sum {j in MN, k in B} (tshar[i,j,k]*6) <= demand[i];


data;
set MN:= include mn;
set B:= include band;
param demand:= include demandu;
param r := include Rlink;
param excu : include mn := include Excu;
param ga := include ga;
param ri := include ri;
solve;
#
display solve_message > amplr_obj.rt;
display tshar > amplr_ts.rt;

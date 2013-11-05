%Finish 1 hop traffic assignment in one index

function [gw_cap1,rs_demand_d,rs_demand_u,traf_d_out,traf_u_out,tshar]=traffic_assign(gw_cap1,rs_demand_d,rs_demand_u,gw_temp,traf_d_out,traf_u_out,index,md_satisfy,R_link,temp,iwg2,tshar)



while((sum(rs_demand_d(index))+sum(rs_demand_u(index)))>0 && sum(gw_cap1)>0)

    
    traf_d=traf_d_out;
    traf_u=traf_u_out;


[gw_cap1,rs_demand_d,rs_demand_u,traf_d,traf_u]=traffic_assign_hop1(gw_cap1,rs_demand_d,rs_demand_u,gw_temp,traf_d,traf_u);

traf_d_out=traf_d_out+traf_d;
traf_u_out=traf_u_out+traf_u;

tshar(gw_temp,md_satisfy)=(traf_d(gw_temp,md_satisfy)+traf_u(gw_temp,md_satisfy))/R_link(gw_temp,md_satisfy);

index(temp)=[];
[minvalue,temp]=min(iwg2(index));
md_satisfy=index(temp);

if(numel(md_satisfy)>0)
    temp_cap=sum(gw_cap1);
gw_cap1=0.*(R_link(gw_temp,:));
gw_cap1(md_satisfy)=temp_cap;
end

end


function [gw_cap,rs_demand_d,rs_demand_u,traf_d_out,traf_u_out,tshar]=traffic_interation(Ad_d2,tshar,Ad_d1,rs_demand_d,rs_demand_u,R_link,gw_temp,iwg2,traf_d,traf_u,index,md_satisfy,gw_cap1,temp)



[gw_cap,rs_demand_d,rs_demand_u,traf_d_out,traf_u_out,tshar]=traffic_assign(gw_cap1,rs_demand_d,rs_demand_u,gw_temp,traf_d,traf_u,index,md_satisfy,R_link,temp,iwg2,tshar);

% if(sum(gw_cap)>0 && (sum(rs_demand_d)+sum(rs_demand_u))>0)
%     
%     iwg2_inter=sum(Ad_d2(:,index))
% 
%     [mavalue,gw_temp_inter]=max(iwg2_inter);
%     
%     
%     index=find(Ad_d1(gw_temp,:)>0);
%     [minvalue,temp]=min(iwg2(index));
%     md_satisfy=index(temp);
% 
%     
%     gw_cap1=0.*(R_link(gw_temp,:));
%     gw_cap1(md_satisfy)=R_link(gw_temp,md_satisfy)*(1-tshar(gw_temp,md_satisfy));
%     
%     
% end
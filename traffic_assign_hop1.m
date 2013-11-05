% Function to assign gateway node capicity to demand
% Input available capacity of selected gateway node



function [gw_cap1,rs_demand_d,rs_demand_u,traf_d,traf_u]=traffic_assign_hop1(gw_cap1,rs_demand_d,rs_demand_u,gw_temp,traf_d,traf_u)


for i=1:length(gw_cap1)
    
        lptemp=gw_cap1(i)-rs_demand_d(i);
        if(lptemp>=0)
            gw_cap1(i)=lptemp;
            traf_d(gw_temp,i)=rs_demand_d(i);
            rs_demand_d(i)=0;
        
        
            lptemp=gw_cap1(i)-rs_demand_u(i);
            if(lptemp>=0)
                gw_cap1(i)=lptemp;
                traf_u(gw_temp,i)=rs_demand_u(i);
                rs_demand_u(i)=0;
                gw_cap1(i)=lptemp;
            else
                traf_u(gw_temp,i)=gw_cap1(i);
                gw_cap1(i)=0;
                rs_demand_u(i)=-lptemp;
            
            end
        else
            traf_d(gw_temp,i)=gw_cap1(i);
            gw_cap1(i)=0;
            rs_demand_d(i)=-lptemp;
        end
       
        
    
end
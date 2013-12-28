


load demand_current

%mesh_nodes=n_unserved;
mesh_demand_mul(:,ga)=[]
for demand_valu=1:10

for i=1:10
    %mesh_demand=demand_valu*rand(size(mesh_nodes));
    mesh_demand=demand_valu*mesh_demand_mul(i,:);
    out(i)=wioptevaluation(6,act_link,ga,mesh_nodes,mesh_demand)
end

results(demand_valu)=mean(out)

end
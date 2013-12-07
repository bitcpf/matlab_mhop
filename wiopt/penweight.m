function fs2_weight=penweight(act_d1,layer)

weight=[];

for top=1:numel(layer(2,:))  
%top=1;
leaf_index=find(layer(2,:)>layer(2,top));
top_node=layer(1,top);
leaf=layer(1,leaf_index);
stack(top)=top_node;
flag=1;
re=[];

A=act_d1([top_node,leaf],[top_node,leaf]);

if numel(A)>1
top_cnt=1;
stack_cnt(top_cnt)=1;
while top_cnt~=0
    prelen=length(stack_cnt);
    i=stack_cnt(top_cnt);
    for j=1:numel(leaf)+1
        
        if A(i,j)==1 && isempty(find(flag==j,1))
            top_cnt=top_cnt+1;
            stack_cnt(top_cnt)=j;
            flag=[flag j];
            re=[re;i j];
            break;
        end
    end
    if length(stack_cnt)==prelen
        stack_cnt(top_cnt)=[];
        top_cnt=top_cnt-1;
    end
end
if numel(re)>0
weight=[weight;top_node numel(re(:,1))];
else
    
weight=[weight;top_node 0];
end

else
    weight=[weight;top_node 0];

end

end
fs2_weight=sortrows(weight,1)
end
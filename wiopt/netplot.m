%å½æ°ånetplot
%ä½¿ç¨æ¹æ³è¾å¥è¯·help netplot
%æ è¿åå¼
%å½æ°åªè½å¤çæ åå¾
%ä½èï¼tiandsp
%æåä¿®æ¹ï¼2012.12.26
function netplot(A,flag,co)
    %è°ç¨æ¹æ³è¾å¥netplot(A,flag)ï¼æ è¿åå¼
    %Aä¸ºé»æ¥ç©éµæå³èç©éµ
    %flag=1æ¶å¤çé»æ¥ç©éµ
    %flag=2æ¶å¤çå³èç©éµ
    %å½æ°åªè½å¤çæ åå¾
    if flag==1      %é»æ¥ç©éµè¡¨ç¤ºæ åå¾
        ND_netplot(A);
        return;
    end
    
    if flag==2      %å³èç©éµè¡¨ç¤ºæ åå¾
        [m n]=size(A);      %å³èç©éµåé»æ¥ç©éµ
        W=zeros(m,m);
        for i=1:n
            a=find(A(:,i)~=0);
            W(a(1),a(2))=1;
            W(a(2),a(1))=1;
        end
        ND_netplot(W);
        return;
    end
           
    function ND_netplot(A)
        [n n]=size(A);
        w=floor(sqrt(n));       
        h=floor(n/w);        
        x=[];
        y=[];
        for i=1:h           %ä½¿äº§ççéæºç¹æå¶èå´ï¼ä½¿æ¾ç¤ºåå¸çæ´å¹¿
            for j=1:w
                x=[x 10*rand(1)+(j-1)*10];
                y=[y 10*rand(1)+(i-1)*10];
            end
        end
        ed=n-h*w;
        for i=1:ed
           x=[x 10*rand(1)+(i-1)*10]; 
           y=[y 10*rand(1)+h*10];
        end
        plot(x,y,co);    
        
        title('Topology Graph'); 
        for i=1:n
            for j=i:n
                if A(i,j)~=0
                    c=num2str(A(i,j));                      %å°Aä¸­çæå¼è½¬åä¸ºå­ç¬¦å              
                    text((x(i)+x(j))/2,(y(i)+y(j))/2,c,'Fontsize',10);  %æ¾ç¤ºè¾¹çæå¼
                    line([x(i) x(j)],[y(i) y(j)]);      %è¿çº¿
                end
                text(x(i),y(i),num2str(i),'Fontsize',14,'color','r');   %æ¾ç¤ºç¹çåºå·            
                hold on;
            end
        end  
    end
end
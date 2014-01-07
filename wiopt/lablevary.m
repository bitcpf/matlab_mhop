clear all
close all

x=1:7;
y=x;
plot(x,y)
% æå®è¦æ´æ¹çåæ è½´å»åº¦
xtk=1:7;
ytk=1:7;
% æ´æ¹åçå»åº¦
xtk_label={'A','B','C','D','E','F','G'};
ytk_label={'A','B','C','D','E','F','G'};
% æ´æ¹åæ è½´å»åº¦
set(gca,'xtick',xtk);set(gca,'xticklabel',xtk_label);
set(gca,'ytick',ytk);set(gca,'yticklabel',ytk_label);
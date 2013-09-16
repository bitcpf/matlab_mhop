function out=alpha_cal(freqmeasure,distance)

% Input measured signal strength in one band (freqmeasure) and the distance(distance) of the
% measured signal strength


P0=max(freqmeasure);
index=find(freqmeasure==P0)
d0=min(distance);
alpha = (P0 - (freqmeasure(:) - 0))./(10.*log10(distance(:)./d0));
index=find(alpha>4);
alpha(index)=[];
index=find(alpha<0);
alpha(index)=[];

alpha(1)=[];


aver_alpha=mean(alpha);
out=aver_alpha;
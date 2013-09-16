%PATHLOSS_CONFIDENCE.M
%This function takes in a vector of received power data and a corresponding
%vector of distance data. It outputs the alpha and L parameters of the curve
%that describes pathloss characteristics with a given reliability.

function [bestP,bestalpha,bestL] = fit_pathloss(distvec, sigvec, prob)

[sortdist,sortindex] = sort(distvec); %sort distances and record indices to sort pwrvec similarly

alphamin = 0;
alphamax = 5;
alphastep = 0.1;

Lmin = 1;
Lmax = 300;
Lstep = 1;

bestalpha = 0;
bestL = 1;
bestP = zeros(size(distvec));
besterror = inf;

for alpha = alphamin:alphastep:alphamax
    
    for L = Lmin:Lstep:Lmax
        
        P = pathloss_curve(distvec, alpha, L); %generate the received power curve
        
%         size(P)
%         size(sigvec)
        
        diffvec = P - sigvec; %difference between predicted and actual signal strength
        numbelow = length(find(diffvec>0)); %number of measurements that were worse than we predict
        probbelow = numbelow/length(diffvec); %probability that a measurement is worse than our prediction
        probabove = 1-probbelow;
        proberror = abs(probabove - prob); %compare with desired reliability
        
        if proberror < besterror
            bestP = P;
            besterror = proberror;
            bestalpha = alpha;
            bestL = L;
        end
    end
end

sortP = bestP(sortindex);

figure
hold on
scatter(distvec,sigvec)
% plot(sortdist,sortP)
alldist = min(distvec):max(distvec);
allP = pathloss_curve(alldist,bestalpha,bestL);
% plot(alldist,allP,'g');
semilogy(alldist,allP,'g');


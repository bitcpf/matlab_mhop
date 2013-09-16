%FIT_PATHLOSS.M
%This function takes in a vector of received power data and a corresponding
%vector of distance data. It outputs the alpha and L parameters of the best
%fitting pathloss curve.

function [bestP,bestalpha,bestL] = fit_pathloss(distvec, sigvec)

% pwrvec

[sortdist,sortindex] = sort(distvec); %sort distances and record indices to sort pwrvec similarly

% sortpwr = pwrvec(sortindex);

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

% pwrvec

% sigvec = 10:1

for alpha = alphamin:alphastep:alphamax
    
    for L = Lmin:Lstep:Lmax
        
        P = pathloss_curve(distvec, alpha, L); %generate the received power curve
        
%         size(P)
%         size(sigvec)
        
        sqrerror = sum((P(:) - sigvec(:)).^2); %sum of the squared error between actual and predicted values
        abserror = sum(abs(P(:) - sigvec(:))); %sum of the magnitudes of the errors
        
        
        if sqrerror < besterror
%         if abserror < besterror
            bestP = P;
            besterror = sqrerror;
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
% plot(alldist,allP);
semilogy(alldist,allP);


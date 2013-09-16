%VEC_HIST.M
%Given a matrix of numerical values and the indices of two entries of that
%matrix (endpoints of a vector), this function produces a histogram of the
%numerical values encountered along the vector between the two endpoints.

function h = vec_hist(c1,r1,c2,r2,mat)

[colvec, rowvec] = find_line(c1,r1,c2,r2); %indices of intervening entries

% numvec = mat(rowvec,colvec); %vector of entries

L = length(rowvec);
numvec = zeros(1,L);
for n = 1:L
    numvec(n) = mat(rowvec(n),colvec(n));
end

h = hist(numvec,0:7); %make a histogram of the entries



figure
% subplot(1,2,1)
imagesc(mat)
colorbar
hold on
plot(colvec,rowvec,'g')
plot(c1,r1,'gx')
plot(c2,r2,'gx')
% subplot(1,2,2)
figure
% hist(numvec,0:7)
pie(h,{'Other','Single Family','Multi-Family','Office','Industrial','Institutional','Green Space','Commercial'})
    

%yellow = 1 = single family residential
%orange = 2 = multi family residential
%magenta = 3 = office
%purple = 4 = industrial
%blue = 5 = public and institutional
%green = 6 = open space
%red = 7 = commercial
%other = 0 = undeveloped, roads, etc.

function d = pearson_correlation_dist(XI, XJ)
%pearson_correlation Implementation of the 'correlation' switch of pdist,
%for reference.

m=size(XJ,1); % number of samples of p
p=size(XI,2); % dimension of samples

assert(p == size(XJ,2)); % equal dimensions
assert(size(XI,1) == 1); % pdist requires XI to be a single sample

d=zeros(m,1); % initialize output array
stdXI = std(XI);
for i=1:m
    % same as 1 - diag(corr([XI', XJ(i,:)']), 1)
    covariance = cov(XI, XJ(i,:)); covariance = covariance(1,2);
    d(i,1) = 1 - covariance/stdXI/std(XJ(i,:));
end

end


function d = sq_pearson_correlation_dist(XI, XJ)
%sqpearson_correlation Implementation of squared Pearson correlation distance

m=size(XJ,1); % number of samples of p
p=size(XI,2); % dimension of samples

assert(p == size(XJ,2)); % equal dimensions
assert(size(XI,1) == 1); % pdist requires XI to be a single sample

d=zeros(m,1); % initialize output array
stdXI = std(XI);
for i=1:m
    covariance = cov(XI, XJ(i,:)); covariance = covariance(1,2);
    r = covariance/stdXI/std(XJ(i,:));
    d(i,1) = 1 - r^2;
end

end


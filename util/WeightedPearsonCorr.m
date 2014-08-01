function rho_w = WeightedPearsonCorr(XI,XJ, w )
%WeightedPearsonCorr Pearson Correlation with Weights for use with
%outlier ensembles
%   Detailed explanation goes here

% Ensure that w is a column vector summing to 1
if size(w, 1) == 1
    w = w';
elseif size(w, 2) == 1
else
    error('w must be a vector');
end
w = w ./ sum(w);

m=size(XJ,1); % number of samples of p
p=size(XI,2); % dimension of samples

assert(p == size(XJ,2)); % equal dimensions
assert(size(XI,1) == 1); % pdist requires XI to be a single sample

mean_XI = dot(w, XI);
var_XI = dot(w, (XI - mean_XI).^2);

mean_XJ = sum(XJ * w, 2);
var_XJ = sum(((XJ - repmat(mean_XJ, 1, size(XJ, 2))).^2) * w, 2);

cov_XIJ = sum( (repmat((XI-mean_XI), size(XJ, 1), 1) .* (XJ - repmat(mean_XJ, 1, size(XJ, 2)))) * w, 2);

rho_w = cov_XIJ ./ sqrt(var_XJ) /  sqrt(var_XI);


% rho_w=zeros(m,1); % initialize output array
% for i=1:m
%     mean_XJ = dot(w, X
%     var_XJ
%     covariance = cov(XI, XJ(i,:)); covariance = covariance(1,2);
%     d(i,1) = 1 - covariance/stdXI/std(XJ(i,:));
% end

end


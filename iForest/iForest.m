function forest = iForest(X, t, psi)
%iForest Construct a "forest" (set) of isolation trees
%   X: the data, each row is an instance
%   t: the number of trees to construct
%   psi: the sub-sampling size

height_limit = ceil(log2(psi));
[numdata ~] = size(X);

for i=1:t
    sampleind = randsample(1:numdata, psi);
    X_sample = X(sampleind, :);
    forest(i) = iTree(X_sample, 0, height_limit);
end

end


function forest = SCiForest(X, t, psi, num_attributes, num_hyperplanes)
%iForest Construct a "forest" (set) of isolation trees
%   X: the data, each row is an instance
%   t: the number of trees to construct
%   psi: the sub-sampling size

height_limit = ceil(log2(psi));
[numdata ~] = size(X);
if nargin < 5
    num_hyperplanes = 10;
end
if nargin < 4
    num_attributes = 2;
end

for i=1:t
    sampleind = randsample(1:numdata, psi);
    X_sample = X(sampleind, :);
    forest(i) = SCiTree(X_sample, num_attributes, num_hyperplanes, 0, height_limit);
end

end


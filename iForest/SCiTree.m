function [ tree ] = SCiTree(X, num_atts, num_hyperplanes, current_height, height_limit)
%SCiTree Construct an SCiTree out of SCiTreeNode's and iTreeLeaf's
%   num_atts: number of attributes to use for each hyperplane
%   num_hyperplanes: number of hyperplane candidates to consider

if isempty(X)
    m = 0;
else
    [m n] = size(X);
end

if current_height >= height_limit || m <= 2
    tree = iTreeLeaf(m);
else
    % select hyperplane
    params = {};
    best_sd_gain = -Inf;
    for i=1:num_hyperplanes
        % Randomly choose the attributes to use for this hyperplane
        splitatts = randsample(1:n, num_atts);  % index of attribute (column) to split on
        % Draw random coeffiecints from [-1, 1] (this is the normal vector
        % of the hyperplane
        splitattcoefs = 2*rand(num_atts, 1) - 1;
        splitattstds = std(X(:, splitatts));
        % Project data to normal of hyperplane
        proj = (X(:, splitatts) ./ repmat(splitattstds, m, 1)) * splitattcoefs;
        
        % Find split value (split point along the normal of the
        % hyperplane)
        [splitvalue, sd_gain] = find_split_value(proj);
        if sd_gain > best_sd_gain
            params = {splitattcoefs, splitatts, splitattstds, splitvalue};
        end
    end
    if best_sd_gain == -Inf
        warning('Pathological split, no sdgain - weird data (all same values?) Using random hyperplane');
        params = {splitattcoefs, splitatts, splitattstds, splitvalue};
    end
    tree = SCiTreeNode(params{1}, params{2}, params{3}, params{4});
    
    split_bool = false(1, size(X,1));
    for i=1:m
        split_bool(i) = tree.compare(X(i,:));
    end
    
    X_left = X(split_bool, :);
    X_right = X(~split_bool, :); 
    
    tree.insertLeft(SCiTree(X_left, num_atts, num_hyperplanes, current_height+1, height_limit));
    tree.insertRight(SCiTree(X_right, num_atts, num_hyperplanes, current_height+1, height_limit));
end
end


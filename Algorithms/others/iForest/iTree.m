function [ tree ] = iTree(X, current_height, height_limit)
%iTree Construct an iTree out of iTreeNode's and iTreeLeaf's
%   

if isempty(X)
    m = 0;
else
    [m n] = size(X);
end

if current_height >= height_limit || m <= 1
    tree = iTreeLeaf(m);
else
    splitatt = randi(n);  % index of attribute (column) to split on
    a = min(X(:, splitatt));
    b = max(X(:, splitatt));
    splitvalue = a + (b-a)*rand();
    
    split_bool = X(:, splitatt) < splitvalue;
    X_left = X(split_bool, :);
    X_right = X(~split_bool, :); 
    
    tree = iTreeNode(splitatt, splitvalue);
    tree.insertLeft(iTree(X_left, current_height+1, height_limit));
    tree.insertRight(iTree(X_right, current_height+1, height_limit));
end
end


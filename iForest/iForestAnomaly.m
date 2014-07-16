function scores = iForestAnomaly(X, t, psi)
%iForestAnomaly Use the path length to calculate the anomaly score
%   X: a m by n matrix, each row is a data point
%   t: the number of trees to construct
%   psi: the sub-sampling size

forest = iForest(X, t, psi);

[m ~] = size(X);
scores = zeros(m, 1);
for i=1:m
    x = X(i, :);
    for tree=forest
        path_length = 0;
        treenode = tree;
        while ~strcmp(class(treenode), 'iTreeLeaf')
            if treenode.compare(x)
                treenode = treenode.Right;
            else
                treenode = treenode.Left;
            end
            path_length = path_length + 1;
        end
        scores(i) = scores(i) + path_length + adjustment(treenode.Size);
    end
    scores(i) = 2^(-scores(i) / length(forest) / adjustment(m));
end
end

function value=adjustment(n)
%The average path length of an unsuccessful BST search
    if n<=1
        value = 0;
    else
        value = 2 * (log(n-1)+0.5772156649) - 2*(n-1) / n;
    end
end
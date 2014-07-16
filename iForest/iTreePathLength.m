function path_length = iTreePathLength(x, treenode, current_path_length)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% if strcmp(class(treenode), 'iTreeLeaf')
%    path_length = current_path_length + adjustment(treenode.Size);
% else
%    if x(treenode.SplitAttribute) < treenode.SplitValue
%        path_length = iTreePathLength(x, treenode.Left, current_path_length+1);
%    else
%        path_length = iTreePathLength(x, treenode.Right, current_path_length+1);
%    end
% end

path_length = 0;
while ~strcmp(class(treenode), 'iTreeLeaf')
    if x(treenode.SplitAttribute) < treenode.SplitValue
        treenode = treenode.Left;
    else
        treenode = treenode.Right;
    end
    path_length = path_length + 1;
end
path_length = path_length + adjustment(treenode.Size);
end

function value=adjustment(n)
%The average path length of an unsuccessful BST search
    if n<=1
        value = 0;
    else
        value = 2 * (log(n-1)+0.5772156649) - 2*(n-1) / n;
    end
end
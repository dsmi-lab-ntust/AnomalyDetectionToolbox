classdef iTreeLeaf < handle
    % iTreeLeaf A class to represent the leaf (external node)
    % of an isolation tree
    %   An isolation tree is a type of binary tree.
    
    properties
        % The number of training data that ended up at this node
        Size
    end
    
    methods
        function node = iTreeLeaf(size)
            % Construct an iTreeNode object.
            if nargin > 0
                node.Size = size;
            end
        end
    end
    
end
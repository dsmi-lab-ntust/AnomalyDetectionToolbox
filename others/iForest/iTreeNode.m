classdef iTreeNode < handle
    % iTreeNode A class to represent an internal (non-leaf) node of an 
    % isolation tree
    %   An isolation tree is a type of binary tree.
    
    properties
        SplitAttribute
        SplitValue
    end
    
    properties(SetAccess = private)
      Left = iTreeNode.empty;
      Right = iTreeNode.empty;
   end
    
    methods
        function node = iTreeNode(splitatt, splitvalue)
            % Construct an iTreeNode object.
            if nargin > 0
                node.SplitAttribute = splitatt;
                node.SplitValue = splitvalue;
            end
        end
        
        function insertLeft(parentNode, newNode)
            parentNode.Left = newNode;
        end
        
        function insertRight(parentNode, newNode)
            parentNode.Right = newNode;
        end
        
        function leftorright = compare(node, x)
            leftorright = x(node.SplitAttribute) >= node.SplitValue;
        end
    end
    
end


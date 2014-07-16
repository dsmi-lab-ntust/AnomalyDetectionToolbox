classdef SCiTreeNode < handle
    % SCiTreeNode A class to represent an internal (non-leaf) node of an 
    % isolation tree with split-criterion
    %   An isolation tree is a type of binary tree.
    
    properties
        % SplitAttributeWeights and SplitAttributes determine an axis to
        % split along; SplitAttribute
        SplitAttributeCoefs
        SplitAttributes
        SplitAttributeStds
        SplitValue
    end
    
    properties(SetAccess = private)
      Left = SCiTreeNode.empty;
      Right = SCiTreeNode.empty;
   end
    
    methods
        function node = SCiTreeNode(splitattcoefs, splitatts, splitattstds, splitvalue)
            % Construct an iTreeNode object.
            if nargin > 0
                node.SplitAttributeCoefs = splitattcoefs;
                node.SplitAttributes = splitatts;
                node.SplitAttributeStds = splitattstds;
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
            leftorright = (x(node.SplitAttributes) ./ node.SplitAttributeStds) * node.SplitAttributeCoefs - node.SplitValue > 0;
        end
    end
    
end


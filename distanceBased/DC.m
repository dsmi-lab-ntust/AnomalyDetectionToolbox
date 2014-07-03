function [C, C_index, C_dist] = DC(S_prefix, S_number, S_profix, r, k)
% Disk Aware Discord Discovery: Finding Unusual Time Series in Terabyte Sized Datasets
% http://www.cs.ucr.edu/~eamonn/DiskawareDiscords.pdf
    [C, C_index] = DC_Selection(S_prefix, S_number, S_profix, r);
    [C, C_dist] = DC_Refinement(S_prefix, S_number, S_profix, C, C_index, r);
    [~, find] = sort(C_dist, 'descend');
    find = find(1:min(k, size(find, 1)), :);
    C = C(find, :);
    C_index = C(find, :);
    C_dist = C(find, :);
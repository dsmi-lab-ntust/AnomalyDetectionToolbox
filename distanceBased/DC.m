function [C, C_dist] = DC(S_prefix, S_number, S_profix, r)
% Disk Aware Discord Discovery: Finding Unusual Time Series in Terabyte Sized Datasets
% http://www.cs.ucr.edu/~eamonn/DiskawareDiscords.pdf
    [C C_index] = DC_Selection(S_prefix, S_number, S_profix, r);
    [C, C_dist] = DC_Refinement(S_prefix, S_number, S_profix, C, C_index, r);
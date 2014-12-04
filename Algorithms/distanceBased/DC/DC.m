function [C, C_index, C_dist] = DC(S_prefix, S_number, S_profix, r, k)
%
% Discord Candidate                                                 
% Authors: Dragomir Yankov, Eamonn Keogh and Umaa Rebbapragada      
% Original paper :                                                  
% Disk Aware Discord Discovery: Finding Unusual Time Series         
% in Terabyte Sized Datasets                                        
% Website : http://www.cs.ucr.edu/~eamonn/selected_publications.htm 
% e-mail : {dyankov,eamonn}@cs.ucr.edu, urebbapr@cs.tufts.edu       
% Programmer: Wei-Chih Lai                                          
%                                                                   
% Inputs                                                            
%   S_prefix: a string as prefix for path of files                  
%   S_number: 1x1 integer means number of files                     
%   S_profix: a string as profix for path of files                  
%   r: 1x1 integer means threshold                                  
%   k: 1x1 integer means number of top outliers                     
%                                                                   
% Outputs                                                           
%   C: kxn vector                                                   
%      outlier instances                                            
%   C_index: kx1 vector                                             
%      index of outliers in origin datasets                         
%   C_dist: kx1 vector                                              
%      distance of outliers                                         
%
    assert(k > 0);
    [C, C_index] = DC_Selection(S_prefix, S_number, S_profix, r);
    [C, C_dist] = DC_Refinement(S_prefix, S_number, S_profix, C, C_index, r);
    [~, index] = sort(C_dist, 'descend');
    index = index(1:min(size(C_dist, 1), k), 1);
    C = C(index, :);
    C_index = C_index(index, :);
    C_dist = C_dist(index, :);
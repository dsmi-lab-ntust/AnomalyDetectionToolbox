function [suspicious_index lof] = LOF(A, k)
%
% Local Outlier Factor                                              
% Authors: Markus M. Breunig, Hans-Peter Kriegel,                    
%          Raymond T. Ng, J?rg Sander                               
% Original paper :                                                  
% LOF: Identifying Density-Based Local Outliers                     
% e-mail : { breunig | kriegel | sander }                           
%          @dbs.informatik.uni-muenchen.de                          
%          rng@cs.ubc.ca                                            
% Programmer: Yi-Ren Yeh(yirenyeh@gmail.com)                        
% modified by: Zi-Wen Gui(evan176@hotmail.com)                      
%                                                                   
%                                                                   
% Inputs                                                            
%   A: the data matrix, each row represents an instance             
%   k: the number of nearest neighbors, specified as an integer or  
%      as a fraction of the total number of data points             
%                                                                   
% Outputs                                                           
%   lof: the local outlier factor for each instance                 
%   suspicious_index: the ranking of instances according to their   
%                     suspicious score                              
%                     For example, suspicious_index(i)=j means the  
%                     ith instance is in jth position in the ranking
%

if k < 1
    [numrows ~] = size(A);
    k = round(k*numrows);
end
 
try
    %Find the nearest neighbors by "KDTree" for each elements
    [k_index, k_dist] = knnsearch(A,A,'k',k+1,'nsmethod','kdtree','IncludeTies',true);
    %Ignore first element(itself) at nearest neighbors 
    k_index = cellfun(@(x) x(2:end),k_index,'UniformOutput',false);
    numneigh = cellfun('length',k_index);
    %Get k-distance
    k_dist1 = cell2mat(cellfun(@(x) x(end),k_dist,'UniformOutput',false));
    %Get row length of matrix A
    n = length(A(:,1));
    %Initialize lrd_value vector
    lrd_value = zeros(n,1);
    %Calculate lrd for each elements
    for i = 1:n
        lrd_value(i) = lrd(A, i, k_dist1, k_index, numneigh(i));
    end
    %Initialize lof vector
    lof = zeros(n,1);
    %Calculate LOF
    for i = 1:n
        lof(i) = sum(lrd_value(k_index{i})/lrd_value(i))/numneigh(i);
    end
    %Indices from sorting lof are the suspicious score rankings
    [~,suspicious_index]=sort(lof,'descend');
    
catch err
    if (strcmp(err.message, 'Invalid parameter name: IncludeTies.'))
        warning('MATLAB:LOF', 'Matlab not newest version? Falling back to old version.')
        [suspicious_index lof] = LOF_old(A, k);
    else
        rethrow(err)
    end
    
end

%=========================================================================
function lrd_value = lrd(A, index_p, k_dist,k_index, numneighbors)
%Calculate the reachability distance for nearest neighbors
Temp = repmat(A(index_p,:), numneighbors, 1) - A(k_index{index_p}, :);
Temp = sqrt(sum(Temp.^2,2));
reach_dist = max([Temp k_dist(k_index{index_p})],[],2);
%Calculate the local reachability density for each elements
lrd_value = numneighbors/sum(reach_dist);



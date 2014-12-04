function [suspicious_index cof sbn_paths] = COF(A, k)
%
% Connectivity-based Outlier Factor                                      
% Reference :                                                            
% Enhancing Effectiveness of Outlier Detections for Low Density Patterns 
% Authors: Jian Tang, Zhixiang Chen, Ada Wai-chee Fu, David W. Cheung    
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

%Find the nearest neighbors by "KDTree" for each elements 
[k_index, ~] = knnsearch(A,A,'k',k+1,'nsmethod','kdtree','IncludeTies',true);
%Ignore first element(itself) at nearest neighbors 
k_index = cellfun(@(x) x(2:end),k_index,'UniformOutput',false);
numneigh = cellfun('length',k_index);
%Get row length of matrix A
n = length(A(:,1));
ac_dist = zeros(n, 1);
for i = 1:n
    neigh_ind = [i k_index{i}];
    %[ind, dists] = knnsearch(A(neigh_ind, :), A(neigh_ind, :), 'k', length(neigh_ind));
    dists = squareform(pdist(A(neigh_ind, :)));
    %ind = ind(:, 2:end)
    %dists = dists(:, 2:end)
    sbn_path = [1];
    %n = length(neigh_ind)
    out = 2:(numneigh(i)+1);
    sbn_cost = zeros(1, numneigh(i));
    for j = 1:numneigh(i)
        [costs, min_Xs] = min(dists(sbn_path, out));
        [cost, min_Y] = min(costs);
        sbn_cost(j) = cost;
        min_X = min_Xs(min_Y);  % min_X min_Y coord of the minimum element 
                                % in the matrix dists(sbn_path, out)
        sbn_path(j+1) = out(min_Y);  % add to the sbn_path
        out = setdiff(out, sbn_path(j+1));  % and remove it from the set of points to consider
    end
    
    % Map sbn_path back to indices in A
    sbn_paths{i} = neigh_ind(sbn_path);
    weight_vec = numneigh(i):-1:1;
    ac_dist(i) = dot(sbn_cost,weight_vec)*2/numneigh(i)/(numneigh(i)+1);
end

cof = zeros(n,1);
for i = 1:n
    cof(i) = numneigh(i) * ac_dist(i) / sum(ac_dist(k_index{i}));
end

%Indices from sorting COF are the suspicious score rankings
[~,suspicious_index]=sort(cof,'descend');


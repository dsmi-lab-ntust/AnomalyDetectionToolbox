function [origin_ldof] =  LDOF(X, K)
%
% Local Distance-based Outlier Factor                               
% Authors: Ke Zhang1, Marcus Hutter, Huidong Jin                    
% Original paper :                                                  
%     A New Local Distance-Based Outlier Detection                  
%     Approach for Scattered Real-World Data.                       
% e-mail :                                                          
%     {ke.zhang , marcus.hutter}@rsise.anu.edu.au                   
%     Warren.Jin@csiro.au                                           
% Programmer: Wei-Chih Lai                                          
% Time Complexity : O(n^2)                                          
% Inputs                                                            
%   A: Represent NxM data                                           
%      N is number of instances                                     
%      M is number of features                                      
%   K: for knn                                                      
% Outputs                                                           
%   ldof: Nx1 vector                                                
%      ldof value for each instance, means the degree to which an   
%      instance is considered an outlier. If the ldof < 0.5 then    
%      that instance is not considered an outlier.                  
% Note                                                              
%   Time Complexity in original paper is O(n * ln(n)), but that     
%   requires a kd-tree implementation.                              
%
    [X, ia, ic] = unique(X,'rows');
    instance_number = size(ia, 1);
    assert(K > 0 && K < instance_number - 1, 'K for knn is bigger than number of instance');
    ldof = zeros(instance_number, 1);
    for i=1:instance_number
        distance = sqrt(sum((repmat(X(i, :), instance_number, 1) - X).^2, 2));
        distance(i, 1) = Inf;
        [distance, index] = sort(distance);
        knn_distance = sum(distance(1:K, 1)) / K;
        clear distance;
        index = index(1:K, 1);
        knn_inner_distance = 0;
        for j=1:K
            for k=j+1:K
                knn_inner_distance = knn_inner_distance + norm(X(index(j, 1), :) - X(index(k, 1), :));
            end
        end
        knn_inner_distance = knn_inner_distance / (K * (K - 1));
        ldof(i, 1) = knn_distance / knn_inner_distance;
    end
    origin_instance_number = size(ic, 1);
    origin_ldof = zeros(origin_instance_number, 1);
    for i=1:origin_instance_number
        origin_ldof(i, 1) = ldof(ic(i, 1), 1);
    end
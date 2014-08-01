function [suspicious_index abof] = ABOD(A)
%
% Angle Based Outlier Detection                                     
% Authors: Hans-Peter, Kriegel Matthias, Schubert Arthur Zimek      
% Original paper :                                                  
% Angle-Based Outlier Detection in High-dimensional Data In KDD2008 
% Website : http://www.dbs.ifi.lmu.de/                              
% e-mail : {kriegel,schubert,zimek}@dbs.ifi.lmu.de                  
% Programmer: Yi-Ren Yeh                                            
% modified by: Wei-Chih Lai                                         
%                                                                   
% Time Complexity : O(n^3)                                          
%                                                                   
% Inputs                                                            
%   A: Represent NxM data                                           
%      N is number of instance                                      
%      M is number of feature                                       
%                                                                   
% Outputs                                                           
%   abof: Nx1 vector                                                
%      suspicious abof value for each instance                      
%   suspicious_index: Nx1 vector                                    
%      [~,suspicious_index]=sort(abof,'ascend')                     
% Note                                                              
%   each value in output abof was normalized to [0, 1]              
%
    [A, ia, ic] = unique(A,'rows');
    instance_number = size(ia, 1);
    origin_instance_number = size(ic, 1);
    var_array = zeros(instance_number, 1);

    for i=1:instance_number
        var_front = 0;
        var_back = 0;
        denominator = 0;    
        for j=1:instance_number
            if j==i
                continue
            end
            for k=j+1:instance_number
               if k==i 
                    continue
               end
               vector1 = A(j,:) - A(i,:);
               vector2 = A(k,:) - A(i,:);
               norm_vector1Xnorm_vector2 = norm(vector1) * norm(vector2);
               vector1Xvector2T = vector1 * vector2';
               var_front = var_front + (1 / norm_vector1Xnorm_vector2) * (vector1Xvector2T / (norm_vector1Xnorm_vector2 ^ 2)) ^ 2;
               var_back = var_back + (vector1Xvector2T / norm_vector1Xnorm_vector2 ^ 3);
               denominator = denominator + (1 / norm_vector1Xnorm_vector2);
            end
        end
        var_array(i) = var_front / denominator - (var_back / denominator) ^ 2;
    end

    min_var_array = min(var_array);
    abof = (var_array - min_var_array) / (max(var_array) - min_var_array);
    origin_abof = zeros(origin_instance_number, 1);
    for i=1:origin_instance_number
        origin_abof(i, 1) = abof(ic(i, 1), 1);
    end
    abof = origin_abof;
    [~, suspicious_index] = sort(abof);
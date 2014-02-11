function [suspicious_index lof] = LOF(A, k)
%==========================================================================
% This program performs the LOF alogrithm
%--------------------------------------------------------------------------
% input
%   A: the data matrix, each row reprent an instance
%   k: the number of nearest neighbors 
%
% ouput
%   lof: the local outlier factor for each instance 
%   suspicious_index: the ranking of instances according to their
%                     suspiciuous score
%                     For example, suspicious_index(i)=j means the ith 
%                     instance is in jth position in the ranking.
%
% References                                                               
% in anomaly detection toolbox at http://140.118.155.133/m2m/?page_id=83       
% Send your comment and inquiry to Dr. Yi-Ren Yeh (yirenyeh@gmail.com)              
%==========================================================================


[k_index, k_dist] = knnsearch(A,A,'k',k+1,'nsmethod','kdtree');
k_index = k_index(:,2:end);
k_dist = k_dist(:,end);

n = length(A(:,1));
lrd_value = zeros(n,1);
for i = 1:n
    lrd_value(i) = lrd(A, i, k_dist,k_index);
end

lof = zeros(n,1);
for i = 1:n
    lof(i) = sum(lrd_value(k_index(i,:))/lrd_value(i))/k;
end

[non,suspicious_index]=sort(lof,'descend');



%=========================================================================
function lrd_value = lrd(A, index_p, k_dist,k_index)

k = length(k_index(1,:));

% calculate the reach distance
Temp = repmat(A(index_p,:),k,1) - A(k_index(index_p,:),:);
Temp = sqrt(sum(Temp.^2,2));
rd_dsit = max([Temp k_dist(k_index(index_p,:))],[],2);

lrd_value = k/sum(rd_dsit);



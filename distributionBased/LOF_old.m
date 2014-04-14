function [suspicious_index lof] = LOF(A, k)
%#####################################################################
%# Local Outlier Factor                                              #
%# Authors: Markus M. Breunig, Hans-Peter Kriegel,                   # 
%#          Raymond T. Ng, J?rg Sander                               #
%# Oringinal paper :                                                 #
%# LOF: Identifying Density-Based Local Outliers                     #
%# e-mail : { breunig | kriegel | sander }                           #
%#          @dbs.informatik.uni-muenchen.de                          #
%#          rng@cs.ubc.ca                                            #
%# Programmer: Yi-Ren Yeh(yirenyeh@gmail.com)                        #
%# modified by: Zi-Wen Gui(evan176@hotmail.com)                      #
%#                                                                   #
%#                                                                   #
%# Inputs                                                            #
%#   A: the data matrix, each row reprent an instance                #
%#   k: the number of nearest neighbors                              #
%#                                                                   #
%# Outputs                                                           #
%#   lof: the local outlier factor for each instance                 #
%#   suspicious_index: the ranking of instances according to their   #
%#                     suspiciuous score                             #
%#                     For example, suspicious_index(i)=j means the  #
%#                     ith instance is in jth position in the ranking#
%#####################################################################


%Find the nearest neighbors by "KDTree" for each elements 
[k_index, k_dist] = knnsearch(A,A,'k',k+1,'nsmethod','kdtree');
%Ignore first element(itself) at nearest neighbors 
k_index = k_index(:,2:end);
%Get k-distance
k_dist1 = k_dist(:,end);
%Get row length of matrix A
n = length(A(:,1));
%Initializa lrd_value vector
lrd_value = zeros(n,1);
%Calculate lrd for each elements
for i = 1:n
    lrd_value(i) = lrd(A, i, k_dist1,k_index, k);
end
%Initializa lof vector
lof = zeros(n,1);
%Calculate LOF
for i = 1:n
    lof(i) = sum(lrd_value(k_index(i,:))/lrd_value(i))/k;
end
%Sort lof factor
[non,suspicious_index]=sort(lof,'descend');



%=========================================================================
function lrd_value = lrd(A, index_p, k_dist,k_index, k)
%Calculate the reachability distance for nearest neighbors
Temp = repmat(A(index_p,:),k,1) - A(k_index(index_p,:),:);
Temp = sqrt(sum(Temp.^2,2));
%max{k-distance(b), d(a, b)}
rd_dsit = max([Temp k_dist(k_index(index_p,:))],[],2);
%Calculate the local reachability density for each elements
lrd_value = k/sum(rd_dsit);



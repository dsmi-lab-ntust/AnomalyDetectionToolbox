function [suspicious_index suspicious_score u] = OD_onlinePCA(A, beta)
%
% Outlier detection via over-sampling online PCA
%
% This function is used for outlier detection. The main idea is using 
% the variation of the first principal direction detect the outlierness
% of each instance(event) in the leave one out procedure. Here the 
% over-sampling on target instance is also used for enlarge the 
% outlierness
%
%
% input
%   A: the data matrix, each row represents an instance
%   beta: forgetting factor
%         For example, beta=0.9 means we decrease the influence of previous
%         data by a factor of 0.9
% output
%   suspicious_score: the suspicious score for each instance
%   suspicious_index: the ranking of instances according to their
%                     suspicious score
%                     For example, suspicious_index(i)=j means the ith 
%                     instance is in jth position in the ranking.
%
% References
% Anomaly Detection via Over-Sampling Principal Component Analysis                                                                     
% Send your comment and inquiry to Dr. Yi-Ren Yeh (yirenyeh@gmail.com)        
%

[n p]= size(A);

A_m = mean(A);
d = 0.0001;
u = ones(p,1);
for i = 1:n
    [u d] = Track_w(A(i,:)-A_m, u, d, 1);
end
u = u/norm(u);


sim_pool = zeros(n,1);
ratio = 1/(n*beta);
for i = 1:n
    temp_mu = (A_m+ratio*A(i,:))/(1+ratio);
    x =A(i,:)-temp_mu;
    [w] = Track_w(x, u, d, beta); 
    w = w/norm(w);
    sim_pool(i,:) = abs(diag(u'*w));
    if (~mod(i,10000))
        display(['Iteration ',num2str(i)])
    end
end

[non,suspicious_index]=sort(sim_pool);
suspicious_score = 1-sim_pool;


%==========================================================================
function [w d] = Track_w(x, w, d, beta)
y = x*w;
d = beta*d+y^2;
e = x'-w*y;
w = w + (y*e)/d;
% function [w d] = Track_w(x, w, d, n, ratio)
% y = x*w;
% d = (1/n)*d+ratio*y^2;
% e = x'-w*y;
% w = w + (y*e)/d;

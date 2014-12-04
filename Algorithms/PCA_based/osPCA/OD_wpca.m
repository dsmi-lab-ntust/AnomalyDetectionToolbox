function [suspicious_index suspicious_score u] = OD_wpca(A,ratio)
%
% Outlier detection via over-sampling PCA
%
% This function is used for outlier detection. The main idea is using 
% the variation of the first principal direction detect the outlierness
% of each instance(event) in the leave one out procedure. Here the 
% over-sampling on target instance is also used for enlarge the 
% outlierness
%
%
% input
%   A: the data matrix, each row represent an instance
%   ratio: the ratio of the oversampling
%          For example, ratio=0.1 means we duplicate the targeted instance
%          with 10 percentage of the whole data
% output
%   suspicious_score: the suspicious score for each instance
%   suspicious_index: the ranking of instances according to their
%                     suspicious score
%                     For example, suspicious_index(i)=j meansthe ith 
%                     instance is in jth position in the ranking.
%
%
 
% the threshold in Power Method
tol=10^(-20);maxiter=500;
 
[n p]= size(A);
A_m = mean(A); % mean
out_prod = A'*A/n; % outer product
[non,u] = PowerMethod(out_prod-A_m'*A_m,ones(p,1),tol,maxiter); % out_prod-A_m'*A_m is covariance matrix
 
% start the "LOO" procedure with over-sampling PCA
sim_pool = zeros(n,1);
for i = 1:n
    temp_mu = (A_m+ratio*A(i,:))/(1+ratio); % update of mean
    temp_cov = (out_prod + ratio*A(i,:)'*A(i,:))/(1+ratio) - temp_mu'*temp_mu; % update of covariance matrix
    [non,u_temp] = PowerMethod(temp_cov,u,tol,maxiter);
    sim_pool(i,:) = abs(diag(u'*u_temp)); % compute the cosine similarity
     if (~mod(i,10000))
         display(['Iteration ',num2str(i)])
     end
end

 
% calculate the suspicious_index and suspicious_score
[non, suspicious_index]=sort(sim_pool);
suspicious_score = 1-sim_pool;
 
 
%====================================================================
function [lambda,v] = PowerMethod(A,x,tol,maxiter)
%====================================================================
% This sub-function is computing the eigenvector via power method
%--------------------------------------------------------------------
%   A: the data matrix, each row represent an instance
%   x: initial vector
%   tol: the tolerance for convergence
%   maxiter: the max iteration in updating the of eigenvector
%
% output
%   lambda: the resulting eigenvalue
%   v: the resulting eigenvalue
%
%--------------------------------------------------------------------
relerr = inf;
niter = 1;
 
while relerr >= tol && niter < maxiter,
   z = x/norm(x,2);
   x = A*z;
   alpha1 = z'*x;
   if niter>1,
      relerr = abs( alpha1-alpha0 )/abs( alpha0 );
   end
   alpha0 = alpha1;
   niter = niter+1;
end
 
lambda = alpha1;
v = z;

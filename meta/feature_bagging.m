function scores = feature_bagging(A, outlier_scorer, k, num_feature_sets)
%feature_bagging Outlier detection via feature bagging ensemble
%   Inputs:
%       A - mxn feature matrix, each row is an instance
%       outlier_scorer - an outlier detection function specified using @
%                for example @FUN
%                Should be of the form
%       
%                function SCORES = FUN(A)
%                taking as the argument A, a mxn feature matrix
%       k - number of features per feature bag
%           if k is false or 0, then we will randomly chose a number
%           between n/2 and n every round
%       num_feature_sets - number of feature bags to use
%   Outputs:
%       score - ensemble anomaly scores produced by feature bagging
%   Reference: Aleksandar Lazarevic and Vipin Kumar. 2005. Feature bagging 
%   for outlier detection. (KDD '05)
[m n] = size(A);

scores = zeros(m, num_feature_sets);
for i=1:num_feature_sets
    if k > 0
        featind = randsample(n, k);
    else
        featind = randsample(n, randi([floor(n/2),n-1]));
    end
    scores(:, i) = outlier_scorer(A(:, featind));
end
%scores = mean(scores, 2);
end


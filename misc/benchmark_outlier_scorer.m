function roc_auc = benchmark_outlier_scorer(A, labels, outlier_scorer)
%benchmark_outlier_scorer A convenient wrapper for benchmarking 
%   Input:
%   A - a mxn dataset, columns are features, rows are data
%   labels - a binary labeling of the rows of A, 1:outlier, 0:not
%   outlier
%   outlier_scorer - an outlier detection function specified using @
%                    for example @FUN
%                    Should be of the form
%       
%                    function SCORES = FUN(A)
%   Output:
%   metrics: a struct containing various metrics based on the result of
%            running outlier_scorer on A with respect to labels

scores = outlier_scorer(A);
[~, ~, ~, roc_auc] = perfcurve(labels, scores, 1);
end


function [roc_auc scores] = benchmark_outlier_scorer(A, labels, outlier_scorer, posclass)
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
%   posclass - the positive class label (scalar), either
%    numeric (for numeric LABELS), logical (for logical LABELS) or char
%    (for function perfcurve)
%    If not specified and the datatype of labels is numeric or boolean, 
%    will assume is either 1 or true, respectively. Otherwise an error will
%    be returned.
%   Output:
%   metrics: a struct containing various metrics based on the result of
%            running outlier_scorer on A with respect to labels

assert(length(unique(labels)) == 2);
if nargin < 4
    if islogical(labels)
        posclass = true;
    elseif isnumeric(labels)
        posclass = 1;
    else
        error('What is the positive class label?');
    end
end



scores = outlier_scorer(A);
[~, ~, ~, roc_auc] = perfcurve(labels, scores, posclass);
end


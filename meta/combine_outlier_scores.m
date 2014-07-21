function [scores_f] = combine_outlier_scores(scores, method)
%Combine outlier scores in an unsupervised manner similar to what
%meta-search engines do
%   Input:
%   scores: outlier scores from different algorithms, each column is a set
%           of scores for the dataset
%   method: the method to use for combining the scores
%       'bfs' - Breadth-First
%       'cumsum' - Cumulative Sum
%   Output:
%   scores_f - combined outlier scores
%Reference: "Feature Bagging for Outlier Detection" KDD 2005

% number of data points, number of anomaly score vectors to combine
[m t] = size(scores);


ranking = zeros(m, 1);
scores_f = zeros(m, 1);

if strcmp(method, 'bfs')
    % sort the columns of scores and inds by the individual columns of scores

    [scores ind] = sort(scores, 1, 'descend');
    
    % Move NaNs to bottom of scores
    for j=1:t
        lastnan = find(isnan(scores(:, j)));
        if lastnan
            lastnan = lastnan(end);
            scores(:,j) = [scores((lastnan+1):end, j); scores(1:lastnan, j)];
            ind(:,j) = [ind((lastnan+1):end, j); ind(1:lastnan, j)];
        end
    end
    
    count = 1;
    for i=1:m
        for j=1:t
            if ranking(ind(i, j)) == 0 && ~isnan(scores(i,j))
                ranking(ind(i, j)) = count; count = count + 1;
                scores_f(ind(i, j)) = scores(i, j);
            end
        end
    end
    
    %[~, ind_f] = sort(scores_f, 'descend');
    
elseif strcmp(method, 'cumsum')
    scores_f = sum(scores, 2);
    %[scores_f ind_f] = sort(scores_f, 'descend');
end


end
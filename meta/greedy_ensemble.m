function [ ensemble_scores in_ensemble] = greedy_ensemble(scores, k)
%greedy_ensemble Summary of this function goes here
%   Input:
%   scores - a set of anomaly scores from a set of individual outlier
%   detectors where each column corresponds to the results of one outlier
%   detector
%   k - the number to use for the union ..... (basicially fraction accept?)
%   Output:
%   ensemble_scores - the anomaly scores of the ensemble
%   in_ensemble - boolean vector specifying which of the detectors are in
%   the ensemble

% Compute target vector
[m t] = size(scores);

target_vec = zeros(m,1);
target_ind = [];
for j=1:t
    [~,ind] = sort(scores(:,j), 'descend');
    target_ind = union(target_ind, ind(1:k));
end
target_vec(target_ind) = 1;

% Weights for the weighted Pearson correlation 
K = sum(target_vec);
w = zeros(m,1);
w(boolean(target_vec)) = (m - K);
w(~boolean(target_vec)) = K;


%% Build ensemble
in_ensemble = false(t,1);
detectors = 1:t;
% Initialize, find detector with highest weighted Pearson correlation to
% target vector
corrs = WeightedPearsonCorr(target_vec', scores', w);
[~, I] = max(corrs);
in_ensemble(I) = true;
detectors = setdiff(detectors, I);
while detectors
    curr_ensemble_scores = mean(scores(:, in_ensemble), 2);
    curr_ensemble_target_corr = WeightedPearsonCorr(curr_ensemble_scores', target_vec', w);
    % Find detector with lowest correlation to the current ensemble
    corrs = WeightedPearsonCorr(curr_ensemble_scores', scores(:, detectors)', w);
    [~, II] = min(corrs);
    I = detectors(II);
    
    % Decide whether to reject or accept this detector into the ensemble
    new_ensemble_scores = mean([scores(:, in_ensemble) scores(:, I)], 2);
    if WeightedPearsonCorr(new_ensemble_scores', target_vec', w) > curr_ensemble_target_corr
        in_ensemble(I) = true;
    end
    detectors = setdiff(detectors, I);
end

ensemble_scores = mean(scores(:, in_ensemble), 2);

end


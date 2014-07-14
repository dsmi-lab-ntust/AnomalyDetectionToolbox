function [reg_scores] = regularize(scores, baseline, inversion_type)
%regularize Regularize anomaly scores
%Inputs:
%  scores: A vector of anomaly scores
%  baseline: The expceted inlier value
%  inversion_type: The type of inversion to use, can be
%    'linear'
%    'log' - logarithimc inversion
%    not given - don't invert the scores
%Outputs: 
%  reg_scores: The regularized scores
%Reference: Kriegel et al. "Interpreting and Unifying Outlier Scores"

if nargin == 3
    if strcmp(inversion_type, 'linear')
        scores = max(scores) - scores;
    elseif strcmp(inversion_type, 'log')
        scores = -log(scores/max(scores));
    end
end
    
reg_scores = scores - baseline;
reg_scores(reg_scores < 0) = 0;

end


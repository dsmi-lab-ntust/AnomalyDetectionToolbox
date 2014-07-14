function [norm_scores] = normalize(scores, scaling_type)
%regularize Normalize anomaly scores
%Inputs:
%  scores: A vector of anomaly scores
%  normalization_type: The type of scaling to use
%    'uniform', or not given - the default, a linear transformation from
%                              0 to 1
%    'gaussian' - gaussian distribution UNIMPLEMENTED
%    'gamma' - gamma distribution UNIMPLEMENTED 
%    'cauchy' - Cauchy-distribution UNIMPLEMENTED
%    'f' - F-distribution UNIMPLEMENTED
%    not given - don't invert the scores
%Outputs: 
%  norm_scores: The normalized scores
%Reference: Kriegel et al. "Interpreting and Unifying Outlier Scores"

if nargin < 2 || strcmp(scaling_type, 'uniform')
    norm_scores = (scores - min(scores)) / range(scores);
elseif strcmp(scaling_type, 'gaussian')
    mu = mean(scores);
    sigma = std(scores);
    norm_scores = erf((scores - mu) / (sqrt(2)*sigma));
    norm_scores(norm_scores < 0 ) = 0;
elseif strcmp(scaling_type, 'gamma')
    phat = gamfit(scores);
    shape = phat(1); scale = phat(2); 
    cdf = gamcdf(scores, shape, scale);
    mu_cdf = gamcdf(shape * scale, shape, scale);
    norm_scores = (cdf - mu_cdf) / (1-mu_cdf);
    norm_scores(norm_scores < 0) = 0;
%elseif strcmp(scaling_type, 'cauchy')
%elseif strcmp(scaling_type, 'f')
else
    error('Unknown scaling type');
end
    
end


function [ res ] = MAD(x, method)
%MAD median absolute deviation
%   Computes the median absolute deviation of each column of the input
%   matrix
%   Can be used as an estimate of the scale (spread) of each column
%
%   Inputs:
%   x : n-by-p input matrix, each column is a univariate data vector
%   method : string argument determining the calculation method
%       "MAD" : (default) median absolute deviation
%       "NMAD" : normalized MAD
%       "QN" : the Qn estimator of Rousseeuw and Croux
%
%   Output:
%   res : the result

if nargin < 2 || strcmp(method, 'MAD')
    med = median(x, 1);
    med = repmat(med, size(x, 1), 1);
    res = median(abs(x - med), 1);
elseif strcmp(method, 'NMAD')
    med = median(x, 1);
    med = repmat(med, size(x, 1), 1);
    res = 1.4826 * median(abs(x - med), 1);
elseif strcmp(method, 'QN')
    [nrow ncol] = size(x);
    h = floor(nrow/2) + 1;
    k = h*(h-1)/2;
    res = zeros(1, ncol);
    offset = nrow*(nrow+1)/2;
    for i=1:ncol
        col = x(:, i);
        pairwise_diff = triu(abs(repmat(col, 1, nrow) - repmat(col', nrow, 1)));
        pairwise_diff = sort(pairwise_diff(:));
        res(i) = get_scaling_constant(nrow) * pairwise_diff(offset+k);
    end
else
    error('Not a valid method')
end

end

function d = get_scaling_constant(n)
    table = [0.399, 0.994, 0.512, 0.844, 0.611, 0.867, 0.669, 0.872];
    if n <= 9
        d = table(n-1);
    elseif mod(n, 2) == 1
        d = n/(n+1.4);
    else
        d = n/(n+3.8);
    end
    d = d * 2.2219;
end
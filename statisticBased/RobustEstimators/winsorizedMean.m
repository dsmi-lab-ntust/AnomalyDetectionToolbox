function [ w_mean ] = winsorizedMean(x, varargin)
%winsorizedMean Returns the trimmed mean of the input series
%   Inputs                                                            
%   x: data vector 

%   k_l: number of smallest values to be removed
%   k_u: number of largest values to be removed, same as k_l if ommitted
%   OR
%   k: number of values to remove from top and bottom, or if <1, percentage
%   of values to remove

%   Outputs                                                           
%   w_mean: Winsorized mean
len = length(x);
if nargin == 2
    assert(varargin{1} >= 0, 'Negative k given')
    if varargin{1} < 1
        assert(varargin{1} < 0.5, 'Asking to remove too much data')
        k_l =  round(len * varargin{1});
        k_u = k_l;
    else
        assert(2*varargin{1} < len)
        k_l = varargin{1};
        k_u = k_l;
    end
end
if nargin == 3
    assert(varargin{1} >= 0 && varargin{2} >= 0, 'Negative k given')
    if varargin{1} < 1
        k_l = round(varargin{1} * len);
    else
        k_l = varargin{1};
    end
    
    if varargin{2} < 1
        k_u = round(varargin{2} * len);
    else
        k_u = varargin{2};
    end
end

x = sort(x);
x = x(1+k_l:end-k_u);
if isempty(x)
    error('Asking to remove too many values')
end
w_mean = sum(x)/len + k_l/len * x(1) + k_u/len * x(end);




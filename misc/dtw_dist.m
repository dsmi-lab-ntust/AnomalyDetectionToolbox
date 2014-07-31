function d = dtw_dist(XI, XJ, radius)
  % Implementation of the DTW distance to use with pdist
  % For reference, not meant to be used because euclidean is built-in to
  % pdist.
  
  m=size(XJ, 1); % number of samples of p
  p=size(XI, 2); % dimension of samples
  
  assert(p == size(XJ, 2)); % equal dimensions
  assert(size(XI, 1) == 1); % pdist requires XI to be a single sample
  
  d = zeros(m, 1); % initialize output array
  
  for i=1:m
    d(i, 1) = cdtw_dist(XI, XJ(i, :), radius);
  end
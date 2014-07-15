function d=angular_cosine(XI,XJ)
  % Implementation of the angular cosine distance, sometimes also called
  % the cosine distance (different from the other, more often-used cosine
  % distance). For use with pdist.
  
  m=size(XJ,1); % number of samples of p
  p=size(XI,2); % dimension of samples
  
  assert(p == size(XJ,2)); % equal dimensions
  assert(size(XI,1) == 1); % pdist requires XI to be a single sample
  
  d=zeros(m,1); % initialize output array
  
  normXI = norm(XI);
  for i=1:m
    similarity=dot(XI, XJ(i,:))/normXI/norm(XJ(i,:));
    d(i,1)=acos(similarity)/pi;
  end
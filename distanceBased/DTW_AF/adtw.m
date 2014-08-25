function distance=adtw(x,y,window,radius)
%approximate sequence by using approximation_sequence and dtw to compute the distance between two sequence
%x and y: time sequence formed as row vector (can have different length)
%radius: the constrained size to compute the dtw distance,  If radius == Inf, distance is the unconstrained dynamic time warping distance.

distance=cdtw_dist(approximation_squence(x,window),approximation_squence(y,window),radius);

end
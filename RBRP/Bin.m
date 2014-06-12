function B = Bin(Binsize, k, D)
% Fast Mining of Distance-Based Outliers in High-Dimensional Datasets
% Input :
%   Binsize : the maximum size of a bin
%   k : the number of partitions
%   D : data points to be binned
% Output :
%   B : the set of bins.
    assert(k > 0);
    B = {};
    [IDX, C] = kmeans(D, k);
    for i=1:k
        p = find(IDX == i);
        if size(p, 1) > Binsize
            sub_B = Bin(Binsize, k, D(p, :));
            for j=1:size(sub_B, 1)
                index = size(B, 1) + 1;
                B(index, 1) = sub_B(j, 1);
                B(index, 2) = sub_B(j, 2);
            end
        else
            index = size(B, 1) + 1;
            B(index, 1) = {D(p, :)};
            B(index, 2) = {C(i, :)};
        end
    end
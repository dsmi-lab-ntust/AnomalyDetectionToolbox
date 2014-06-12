function O = FindOutliers(k, n, B)
% Fast Mining of Distance-Based Outliers in High-Dimensional Datasets
% Input :=
%   k : the number of nearest neighbors
%   n : the number of outliers to be returned
%   B : the sets of data points
% Output :
%   O : the set of outliers
    c = 0;
    O = {};
    max_outlier_dist = -1;
    for i=1:size(B, 1)
        b = B{i, 1};
        for j=1:size(b, 1)
            neighbors = {};
            maxdist = -1;
            distances = [];
            for k=1:size(B, 1)
                distances = [distances norm(B{i, 2} - B{k, 2})];
            end
            [~, order] = sort(distances);
            for k=1:size(order, 2)
                t = B{order(1, k), 1};
                for l=1:size(t, 1)
                    if b(j, :) == t(k, :)
                        continue;
                    end
                    if size(neighbors, 1) < k
                        neighbors{size(neighbors, 2) + 1, 1} = t(k, :);
                        if norm(b(j, :) - t(k, :)) > maxdist
                            maxdist = norm(b(j, :) - t(k, :));
                        end
                    elseif norm(b(j, :) - t(k, :)) < maxdist
                        neighbor_distances = [];
                        for l=1:size(neighbors, 1)
                            neighbor_distances = [neighbor_distances norm(b(j, :) - neighbors{l, 1})];
                        end
                        neighbor_distances = [neighbor_distances norm(b(j, :) - t(k, :))];
                        [~, index] = sort(neighbor_distances);
                        neighbors{index(1, end), 1} = t(k, :);
                        maxdist = neighbor_distances(1, index(1, end - 1));
                    end
                    if size(neighbors, 1) >= k && c > norm(b(j, :) - t(k, :))
                        break;
                    end
                end
            end
            if size(O, 1) < n
                index = size(O, 1) + 1;
                O{index, 1} = b(j, :);
                O{index, 2} = maxdist;
                if maxdist > max_outlier_dist
                    max_outlier_dist = maxdist;
                end
            elseif maxdist > max_outlier_dist
                outlier_distances = [];
                for k=1:size(O, 1)
                    outlier_distances = [outlier_distances O{k, 2}];
                end
                [~, index] = sort(outlier_distances);
                O{index(1, 1), 1} = b(j, :);
                O{index(1, 1), 2} = maxdist;
                max_outlier_dist = maxdist;
            end
        end
    end
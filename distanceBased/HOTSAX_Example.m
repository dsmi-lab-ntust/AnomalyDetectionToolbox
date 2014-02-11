% load from HOTSAX_data
% 1. data - a sequence data which is part of data "mitdbx_mitdbx_108"
% 2. n    - the length of SAX sliding window size which now set as 100
load HOTSAX_data

% run HOTSAX
[best_so_far_dist, best_so_far_loc] = HOTSAX(data, n);

% plot
clf
hold on;
plot(data);
if ~isnan(best_so_far_loc)
    plot(best_so_far_loc:best_so_far_loc+n,data(best_so_far_loc:best_so_far_loc+n), 'r');
end
hold off;
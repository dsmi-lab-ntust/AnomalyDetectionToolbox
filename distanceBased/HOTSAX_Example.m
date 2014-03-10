load HOTSAX_data

[best_so_far_dist, best_so_far_loc] = HOTSAX(data, n);

clf
hold on;
plot(data);
if ~isnan(best_so_far_loc)
    plot(best_so_far_loc:best_so_far_loc+n,data(best_so_far_loc:best_so_far_loc+n), 'r');
end
hold off;
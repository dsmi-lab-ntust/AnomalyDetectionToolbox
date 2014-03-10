%load testing data from HOTSAX_data.mat
%which will load "data" and "n" that used in HOTSAX below
%in this case "data" is a timeseries data which size is 1000
%this "data" is part of Space Shuttle dataset
%"n" is the window size we use in SAX(or so called timeseries2symbol)
load HOTSAX_data

%in this demo, we only use best_so_far_loc while we plot the figure
[best_so_far_dist, best_so_far_loc] = HOTSAX(data, n);

%plot the figure
clf
hold on;
plot(data);
if ~isnan(best_so_far_loc)
    plot(best_so_far_loc:best_so_far_loc+n,data(best_so_far_loc:best_so_far_loc+n), 'r');
end
hold off;
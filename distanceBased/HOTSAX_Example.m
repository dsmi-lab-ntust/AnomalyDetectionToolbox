clf
hold on;
x = 0:0.01:8*pi;
data = [x', sin(x)'];
plot(data(:,1), data(:,2));
axis([0, 8*pi, -3, 3]);
legend('original data');
grid on;

pause;

clf
hold on;

data_length = length(data)
for idx = 1500:2000
    data(idx,2) = cos(data(idx,1));
end;
plot(data(:,1), data(:,2));
axis([0, 8*pi, -3, 3]);
legend('human modified data');
grid on;

pause;

%in this demo, we only use best_so_far_loc while we plot the figure
n = 500;
[best_so_far_dist, best_so_far_loc] = HOTSAX(data(:,2), n, 'nseg 4')

%plot the figure
hold on;
if ~isnan(best_so_far_loc)
    plot_x = data(best_so_far_loc:best_so_far_loc+n, 1);
    plot_y = data(best_so_far_loc:best_so_far_loc+n, 2);
    plot(plot_x,plot_y, 'r');
    legend('human modified data', 'anomaly detect');
end
hold off;
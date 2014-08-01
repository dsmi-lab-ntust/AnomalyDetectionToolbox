%Set parameters: k and threshold of cof
k = 7;
thresholds = 0.9:0.01:1.10;

disp('Demo COF')

data=[(1:10)' rand(10,1)*0.1];
data=[data; 5 1.5;];
data=[data; [(1:1.5:10)' rand(7,1)*0.2 - 10]];

axis([0 10 -5 2]);
scatter(data(:, 1), data(:, 2));


for threshold=thresholds
    
    clf;
    subplot(121)
    [~, lof] = LOF(data, k);
    target_lof = data(lof>=threshold, :);
    normal_lof = data(lof<threshold, :);
    hold on
    scatter(normal_lof(:, 1), normal_lof(:, 2), 'b');
    scatter(target_lof(:, 1), target_lof(:, 2), 'rx')
    title(sprintf('LOF, threshold=%f', threshold));
    axis([0 10 -15 2]);
    hold off
    subplot(122)
    hold on
    [~, cof] = COF(data, k);
    target_cof = data(cof>=threshold, :);
    normal_cof = data(cof<threshold, :);
    
    scatter(normal_cof(:, 1), normal_cof(:, 2), 'b');
    scatter(target_cof(:, 1), target_cof(:, 2), 'rx')
    title(sprintf('COF, threshold=%f', threshold));
    axis([0 10 -15 2]);
    hold off
    pause
end
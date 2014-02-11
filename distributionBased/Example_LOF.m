%Set parameters: k and threshold of lof
k = 10;
threshold = 2;

%Test data
data = load('test.mat');
[suspicious_index lof] = LOF(data.test, k);
target = data.test(lof>=threshold, :);
normal = data.test(lof<threshold, :);


%Visualization
%Plot original data
figure(1);
cla;
hold on;
scatter(data.test(:, 1), data.test(:, 2), 'b');
hold off;

%Plot result, red x: outlier, blue circle: normal point
figure(2);
cla;
hold on;
scatter(normal(:, 1), normal(:, 2), 'b');
scatter(target(:, 1), target(:, 2), 'rx')
hold off;
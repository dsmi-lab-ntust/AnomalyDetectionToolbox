%Set parameters: k and threshold of lof
k = 10;
threshold = 2;

%Test data1
test = load('TestData1.mat');
[suspicious_index lof] = LOF(test.data, k);
target = test.data(lof>=threshold, :);
normal = test.data(lof<threshold, :);


%Visualization

%Plot result, red x: outlier, blue circle: normal point
figure(2);
cla;
hold on;
scatter(normal(:, 1), normal(:, 2), 'b');
scatter(target(:, 1), target(:, 2), 'rx')
hold off;


disp('Demo LOF for test data1')
disp('Press Enter for continuing...')
pause
disp('Demo LOF for test data2')


%Test data2
test = load('TestData2.mat');
[suspicious_index lof] = LOF(test.data, k);
target = test.data(lof>=threshold, :);
normal = test.data(lof<threshold, :);


%Visualization

%Plot result, red x: outlier, blue circle: normal point
figure(2);
cla;
hold on;
scatter(normal(:, 1), normal(:, 2), 'b');
scatter(target(:, 1), target(:, 2), 'rx')
hold off;
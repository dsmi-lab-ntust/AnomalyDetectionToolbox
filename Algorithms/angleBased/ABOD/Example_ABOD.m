function [] = Example_ABOD()
    fprintf('In this demo, we will show you how to use ABOD and fastABOD.\n');
    fprintf('\n');
    fprintf('Behold, red "+" expresses anomaly points and blue "+" expresses normal points.\n');
    fprintf('\n');
    fprintf('ABOD with baseline dataset demo will start.\n');
    fprintf('\n');
    fprintf('Baseline.mat contains 6 points.\n');
    fprintf('\n');
    fprintf(' 1  0\n');
    fprintf(' 0  1\n');
    fprintf(' 0  0\n');
    fprintf('-1  0\n');
    fprintf(' 0 -1\n');
    fprintf(' 5  5\n');
    fprintf('\n');
    fprintf('First 5 points are very close to each other and aroind the origin,\n');
    fprintf('and 6th point is far away from origin.\n');
    fprintf('\n');
    fprintf('So obviously 6th will be treat as anomaly.\n');
    fprintf('\n');

    baseline = [1 0;0 1;0 0;-1 0;0 -1;5 5];
    [suspicious_index abof]=ABOD(baseline);
    anomaly=suspicious_index(1);
    normal=suspicious_index(2:end);
    plot(baseline(anomaly,1),baseline(anomaly,2),'r +',baseline(normal,1),baseline(normal,2),'b +');
    axis([-2, 6, -2, 6]);

    fprintf('\n');
    fprintf('\n');
    fprintf('\n');
    fprintf('Press Enter before continuing\n');
    pause;

    fprintf('Loading Iris dataset from UCI\n');
    fprintf('\n');

    load('iris.mat', '-mat');
    fprintf('Processing...\n');
    fprintf('\n');
    fprintf('\n');
    fprintf('\n');

    [suspicious_index abof]=ABOD(iris(:,[1;2;5]));
    anomaly=suspicious_index(1:15,1);
    normal=suspicious_index(16:end,1);
    plot3(iris(anomaly(:,1),1),iris(anomaly(:,1),2),iris(anomaly(:,1),5),'r +',iris(normal(:,1),1),iris(normal(:,1),2),iris(normal(:,1),5),'b +');

    fprintf('ABOD with iris dataset demo(1) will start.\n');
    fprintf('\n');
    fprintf('In iris demo(1), only sepal length, sepal width, class will be considered.\n');
    fprintf('\n');
    fprintf('Other attributes will be used in demo(2), so that we can plot points in 3d graph for you.\n');
    fprintf('\n');
    fprintf('Because this dataset contains 3 class, you will see 3 groups in graph.\n');
    fprintf('\n');
    fprintf('And each group has its anomaly.\n');
    fprintf('\n');

    fprintf('\n');
    fprintf('\n');
    fprintf('\n');
    fprintf('Press Enter before ABOD with iris dataset demo(2).\n');
    pause;

    fprintf('Processing...\n');
    fprintf('\n');
    fprintf('\n');
    fprintf('\n');

    [suspicious_index abof]=ABOD(iris(:,[3;4;5]));
    anomaly=suspicious_index(1:15,1);
    mormal=suspicious_index(16:end,1);
    plot3(iris(anomaly(:,1),3),iris(anomaly(:,1),4),iris(anomaly(:,1),5),'r +',iris(normal(:,1),1),iris(normal(:,1),3),iris(normal(:,1),3),'b +');

    fprintf('In iris demo(2), only petal length, petal width, class will be considered.\n');
    fprintf('\n');

    fprintf('Now you already know how to use ABOD.\n');
    fprintf('\n');
    fprintf('fastABOD is a approximation version of ABOD, so basicly they are same thing.\n');
    fprintf('\n');
    fprintf('You can find all detail information in ABOD.m and fastABOD.m\n');
    fprintf('\n');
    fprintf('Enjoy! :)\n');
    fprintf('\n');
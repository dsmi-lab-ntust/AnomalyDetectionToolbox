currentPath = cd;
cd ../..;
rootPath = cd;
cd util;
[ normalSeqCell ] = cellReader( [rootPath '\benchmarks\Time Series Data\Synthetic Wave\normalSeqs.data.csv'] );
[ unseenSeqCell ] = cellReader( [rootPath '\benchmarks\Time Series Data\Synthetic Wave\unseenSeqs.data.csv'] );

figure;
title('Normal Synthetic Waves')
hold on;
for i = 1:length(normalSeqCell)
    plot(normalSeqCell{i});
end

cd(currentPath);
tic
[score  ] = DTW_AF( unseenSeqCell(1),normalSeqCell,5 ) % it is heavy to compute median of k-distance
figure;
hold on;
title('Unseen Synthetic Wave 1')
for i = 1:length(normalSeqCell)
    plot(normalSeqCell{i});
end
plot(unseenSeqCell{1},'r');
disp(['Anomaly score of unseen synthetic wave 1 is' num2str(score)])
toc
tic
[score  ] = DTW_AF( unseenSeqCell(38),normalSeqCell,5 ) % it is heavy to compute median of k-distance
figure;
hold on;
title('Unseen Synthetic Wave 38')
for i = 1:length(normalSeqCell)
    plot(normalSeqCell{i});
end
plot(unseenSeqCell{38},'r');
disp(['Anomaly score of unseen synthetic wave 38 is' num2str(score)])
toc
clearvars currentPath rootPath i score 
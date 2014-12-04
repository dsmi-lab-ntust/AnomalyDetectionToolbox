currentPath = cd;
cd ../..;
rootPath = cd;
cd util;
[ normalSeqCell ] = cellReader( [rootPath '\benchmarks\Time Series Data\Synthetic Wave\normalSeqs.data.csv'] );
[ unseenSeqCell ] = cellReader( [rootPath '\benchmarks\Time Series Data\Synthetic Wave\unseenSeqs.data.csv'] );

figure;
title('Part of Concatenated Normal Synthetic Waves')
hold on;
s=[];
for i = 1:10
    s=[s normalSeqCell{i}];
end
plot(s);
axisNormal =axis;
axis([axisNormal(1) axisNormal(2) axisNormal(3) axisNormal(4)*2.0])
cd(currentPath);
tic
[score  ] = DTW_AF( unseenSeqCell(1),normalSeqCell,5 ) % it is heavy to compute median of k-distance
figure;
hold on;
title('Unseen Synthetic Wave 1 (normal)')
% for i = 1:length(normalSeqCell)
%     plot(normalSeqCell{i});
% end
plot(unseenSeqCell{1});
axisCurrent = axis;
axis([axisCurrent(1) axisCurrent(2) axisNormal(3) axisNormal(4)*2.0])
disp(['Anomaly score of unseen synthetic wave 1 (normal) is ' num2str(score)])
toc
tic
[score  ] = DTW_AF( unseenSeqCell(38),normalSeqCell,5 ) % it is heavy to compute median of k-distance
figure;
hold on;
title('Unseen Synthetic Wave 38 (abnormal)')
% for i = 1:length(normalSeqCell)
%     plot(normalSeqCell{i});
% end
plot(unseenSeqCell{38},'r');
axisCurrent = axis;
axis([axisCurrent(1) axisCurrent(2) axisNormal(3) axisNormal(4)*2.0])
disp(['Anomaly score of unseen synthetic wave 38 (normal) is ' num2str(score)])
toc
clearvars currentPath rootPath i score s axisNormal axisCurrent
function [ median_kdist ] = DTW_median( historicalSeqsCell,k )
%DTW_MEDIAN Summary of this function goes here
%   Detailed explanation goes here

        distMatrix = zeros(length(historicalSeqsCell),1);
        for i = 1:length(historicalSeqsCell)
            distMatrix(i)= DTW_kDist( historicalSeqsCell{i},historicalSeqsCell([1:i-1 i+1:end]),k);
        end    
        distMatrix=sort(distMatrix);
        median_kdist = distMatrix(ceil(length(distMatrix)/2));
end


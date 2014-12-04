function [ kdist ] = DTW_kDist(  unseenSeq,historicalSeqsCell,k ,approximateParams )
%DTW_KDIST Summary of this function goes here
%   Detailed explanation goes here
% mode 
%   1: compute k-distance(unseenSeq) and median of k-distance(historicalSeqsCell)
%   2: compute k-distance(unseenSeq)

    
    
    distMatrix = zeros(length(historicalSeqsCell),1);
%     score = zeros(1,length(targetSeqs));
    if nargin <4
    
        for i = 1:length(historicalSeqsCell)
            distMatrix(i)= dtw(unseenSeq,historicalSeqsCell{i});       
        end 
    else
        for i = 1:length(historicalSeqsCell)
            distMatrix(i)= adtw(unseenSeq,historicalSeqsCell{i},approximateParams(1),approximateParams(2));       
        end 
    end
    distMatrix=sort(distMatrix);
    kdist = mean(distMatrix(1:k));    
    
    
end


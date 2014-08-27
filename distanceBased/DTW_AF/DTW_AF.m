function [score  ] = DTW_AF( unseenSeqs,historicalSeqsCell,k ,outputMode,approximateParams)
%
%                                    
% Referred paper :                                                  
% Variable length methods for detecting anomaly patterns in time series%                                
% Programmer: Jing-Yao Lin                                        
%                                                              
% Inputs                                                            
%   unseenSeqs: 
%       unseen time series data 1xN instances which are stored in cell format
%   historicalSeqsCell: 
%       cell which includes normal time series data only. 
%       each instance of data can be different length. 
%   k: 
%       parameter for computing k-distance             
%   outputMode: 
%       1: the output is ratio of k-distance(unseenSeq) to median(historicalSeqsCell),
%       but very time-consuming to compute median(historicalSeqsCell).
%       2: simply compute k-distance(unseenSeq) as output score
%   approximateParams: 
%       We provided a approximate version of DTW for speeding up.
%       approximateParams should be 2xN matrix, such as [window, radius]
%       which is described in adtw.m file
% Outputs                                                           
%   score: 1x1 vector                                                
%      suspicious score for unseen data                   
%            
%


    if nargin <4
        outputMode = 2;
    end
    score = zeros(size(unseenSeqs));
    if outputMode ==2
        for i = 1:length(unseenSeqs)
            unseenSeq=unseenSeqs{i};
            if nargin == 5
                [ score(i)] = DTW_kDist(  unseenSeq,historicalSeqsCell,k,approximateParams );
            else
                [ score(i)] = DTW_kDist(  unseenSeq,historicalSeqsCell,k );
            end
        end
    
    elseif outputMode ==1
      
        [ median_kdist ] = DTW_median( historicalSeqsCell,k );
        for i = 1:length(unseenSeqs)
            unseenSeq=unseenSeqs{i};
            if nargin == 5
                [ kdist ]= DTW_kDist(  unseenSeq,historicalSeqsCell,k,approximateParams);
            else
                [ kdist ]= DTW_kDist(  unseenSeq,historicalSeqsCell,k);
            end
            score(i)=kdist/median_kdist;
        end
    end
    
    
end


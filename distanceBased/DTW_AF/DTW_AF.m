function [score  ] = DTW_AF( unseenSeqs,historicalSeqsCell,k ,mode)
%
%                                    
% Referred paper :                                                  
% Variable length methods for detecting anomaly patterns in time series%                                
% Programmer: Jing-Yao Lin                                        
%                                                              
% Inputs                                                            
%   targetSeq: 
%       unseen time series data with 1xN matrix
%   historicalSeqsCell: 
%       cell which includes normal time series data only. 
%       each instance of data can be different length. 
%   k: 
%       parameter for computing k-distance             
%   mode: 
%       1: ratio of k-distance(unseenSeq) to median(historicalSeqsCell),
%       but very time-consuming to compute median(historicalSeqsCell).
%       2: simply compute k-distance(unseenSeq) as score
% 
% Outputs                                                           
%   score: 1x1 vector                                                
%      suspicious score for unseen data                   
%            
%


    if nargin <4
        mode = 1;
    end
    score = zeros(size(unseenSeqs));
    if mode ==2
        for i = 1:length(unseenSeqs)
            unseenSeq=unseenSeqs{i};
            [ score(i)] = DTW_kDist(  unseenSeq,historicalSeqsCell,k );
        end
    
    elseif mode ==1
      
        [ median_kdist ] = DTW_median( historicalSeqsCell,k );
        for i = 1:length(unseenSeqs)
            unseenSeq=unseenSeqs{i};
            [ kdist ]= DTW_kDist(  unseenSeq,historicalSeqsCell,k);
            score(i)=kdist/median_kdist;
        end
    end
    
    
end


function [ vectorFeature ] = Vectorization( seriesData )
%
% Vectorization     
% 
% Programmer: Jing-Yao Lin      
%                                                                   
% Inputs                                                            
%   seriesData: NxM matrix or N cells if lengths of time seires are different                                     
%      N is number of time series                                      
%      M is length of time series if input is matrix                                        
%                                                                   
% Outputs                                                           
%   vectorFeature: each time series will be represented as vector
% Note                                                              
%   each value in output abof was normalized to [0, 1]              
%
    vectorFeature = zeros(size(seriesData,1),17);
    
    for ind = 1 : size(seriesData,1)
        if iscell(seriesData)
            nowSeries = seriesData{ind};
        else
            nowSeries = seriesData(ind,:);
        end
        dataLength = length(nowSeries);
% 1) to 3) min, max, mean.    
        tsMin = min(nowSeries,[],2);
        tsMax = max(nowSeries,[],2);
        tsMean = mean(nowSeries,2);
    
        vectorFeature(ind,1) = tsMin;
        vectorFeature(ind,2) = tsMax;
        vectorFeature(ind,3) = tsMean;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %   
% 4) and 5) number of peaks and valleys
% 6) and 7) mean of peak and valley values
% 8) and 9) mean of interval between peaks and valley
%  find peak and valley locations, which include start and end point
        velocitySeriesData = nowSeries(2:end)-nowSeries(1:end-1);
        velocitySeriesDataBoolean = ones(size(velocitySeriesData));
        velocitySeriesDataBoolean(find(velocitySeriesData>=0))=1;
        
        velocitySeriesDataBoolean(find(velocitySeriesData<0))=-1;
        trendDirection = velocitySeriesDataBoolean(:,2:end)+velocitySeriesDataBoolean(:,1:end-1);
        [turnPointLocation] = find(trendDirection==0);
        turnPointLocation=turnPointLocation+1;    
        trendValue = velocitySeriesDataBoolean(turnPointLocation);
        tempIndic = find(trendValue<0);
        peakLocation = turnPointLocation(tempIndic)';
        tempIndic = find(trendValue>0);
        valleyLocation = turnPointLocation(tempIndic)';
%  to compute features of each sample of time series
        nowPeaksIndic=[1;peakLocation;size(nowSeries,2)];
        nowValleysIndic=[1;valleyLocation;size(nowSeries,2)];   
        vectorFeature(ind,4) = length(nowPeaksIndic);
        vectorFeature(ind,5) = length(nowValleysIndic);
        vectorFeature(ind,6) = mean(nowSeries(nowPeaksIndic));
        vectorFeature(ind,7) = mean(nowSeries(nowValleysIndic));
        vectorFeature(ind,8) = mean(nowPeaksIndic(2:end)-nowPeaksIndic(1:end-1));
        vectorFeature(ind,9) = mean(nowValleysIndic(2:end)-nowValleysIndic(1:end-1));   
 % 10) first sensor reading of each time series
 % 11) median of first 10% data points
 % 12) to 16) mean of 5 equal parts of time series
 % 17) summarization of absolute value of changes in amplitude reading of timestamps
        vectorFeature(ind,10) = nowSeries(:,1);    
        vectorFeature(ind,11) = median(nowSeries(:,1:floor(end*0.10)),2);
        segLength = dataLength/5;
        for i = 1:5
            vectorFeature(ind,11+i)=mean(nowSeries(floor(segLength*(i-1))+1:floor(segLength*i)));
        end
        vectorFeature(ind,17) = sum(abs(velocitySeriesData),2);
    end

    
end
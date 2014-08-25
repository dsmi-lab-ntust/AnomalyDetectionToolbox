function [peak_value,peak_index]=approximation_sequence(data,adv)
%data: time sequence data
%adv: window size, creating a series of averages in each adv timestamp (when the duration between peaks too long)
% use slidingavg function(remove some for-loop method)


[peak_value,peak_index]=findpeaks(data);
%check data whether empty or not
if isempty(data)
    peak_index=null;
    peak_value=null;
end
%check findpeaks if empty or not
if isempty(peak_value)
    adv_data=data;
    [value index]=slidingavg(adv_data,adv);
    peak_index(length(peak_index)+1:length(peak_index)+length(index))=ones(1,length(index)).*index;
    peak_value(length(peak_value)+1:length(peak_value)+length(value))=value;
end
%if first peak come before big duration, take average 
if peak_index(1)>adv
    adv_data=data(1:peak_index(1)-1);
    [value index]=slidingavg(adv_data,adv);
    peak_index(length(peak_index)+1:length(peak_index)+length(index))=ones(1,length(index)).*index;
    peak_value(length(peak_value)+1:length(peak_value)+length(value))=value;
end

big_duration=find(diff(peak_index)>adv);
for i =1:length(big_duration)
    adv_data=data(peak_index(big_duration(i))+1:peak_index(big_duration(i)+1)-1);
    %take average for no peak
    [value index]=slidingavg(adv_data,adv);
    peak_index(length(peak_index)+1:length(peak_index)+length(index))= ones(1,length(index)).*peak_index(big_duration(i))+ones(1,length(index)).*index;
    peak_value(length(peak_value)+1:length(peak_value)+length(value))=value;
end

% sort index(because above index is not rank
[peak_index,i]=sort(peak_index);
peak_value=peak_value(i);

%if big duration is in the end of series, take average 
if length(data)-peak_index(length(peak_index))>adv
    adv_data=data(peak_index(length(peak_index))+1:length(data));
    [value index]=slidingavg(adv_data,adv);
    peak_index(length(peak_index)+1:length(peak_index)+length(index))=ones(1,length(index)).*peak_index(end)+ones(1,length(index)).*index;
    peak_value(length(peak_value)+1:length(peak_value)+length(value))=value;
end    

end
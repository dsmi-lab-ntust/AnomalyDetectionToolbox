function [p, best_sd_gain] = find_split_value(x)
% Finds the split value in a fast(er) fashion

x = sort(x);

sigma = std(x);
p = 0;
best_sd_gain = -Inf;
sigma_left = 0;
mean_left = x(1);
mean_of_left_sq = x(1)^2;
sigma_right = std(x(2:end));
mean_right = mean(x(2:end));
mean_of_right_sq = mean(x(2:end).^2);
n = length(x);
for i=2:n
    sd_gain = ( sigma - (sigma_left + sigma_right)/2 ) / sigma;
    if sd_gain > best_sd_gain
        best_sd_gain = sd_gain;
        p = (x(i-1) + x(i))/2;
        %ind = i;
    end
    
    mean_left = (mean_left*(i-1) + x(i)) / i;
    mean_right = (mean_right*(n-i+1) - x(i)) / (n-i);
    
    mean_of_left_sq = (mean_of_left_sq*(i-1) + x(i)^2) / i;
    mean_of_right_sq = (mean_of_right_sq*(n-i+1) - x(i)^2) / (n-i);
    
    sigma_left = sqrt(mean_of_left_sq - mean_left^2);
    sigma_right = sqrt(mean_of_right_sq - mean_right^2);
end
end

% function [p, ind] = find_split_value1(x)
% % Finds the split value in a naive fashion
% sigma = std(x);
% p = 0;
% best_sd_gain = -1;
% 
% for i=2:length(x)
%     sd_gain = ( sigma - (std(x(1:(i-1))) + std(x(i:end)))/2 ) / sigma;
%     if sd_gain > best_sd_gain
%         best_sd_gain = sd_gain;
%         p = (x(i-1) + x(i))/2;
%         ind = i;
%     end
% end
% end



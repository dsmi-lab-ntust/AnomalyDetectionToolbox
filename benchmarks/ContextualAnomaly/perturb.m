function [  perturbedData,labels] = perturb( data,nop )
%#####################################################################
%# Perturbed Data Generation                                         #
%# Programers: Jing-Yao Lin                                          #
%#                                                                   #
%# Please send comments and suggestions to                           #
%# "jyl.ntust@gmail.com"                                             #
%#                                                                   #
%# Inputs                                                            #
%#   data: Matrix from ClimateData.data.csv                          #
%#   nop: Number of data instances should be perturbed, and nop*2    #
%#        data instances will be anomaly. Defult: 10                 #
%#                                                                   #
%# Outputs                                                           #
%#   perturbedData: the output perturbed data                        #
%#   labels: The labels of perturbedData, and "1" indicates anomaly  #
%#                                                                   #
%# Example:                                                          #
%#   perturb( data,10 );                                             #
%#                                                                   #
%#   This perturbed data generator refered to a natural perturbation #
%#   scheme by [1]. Each contextual anomalies data set must include  #
%#   contextual attribute y and behavioral attribute x. In this      #
%#   dataset, for a temperature sensor, a contextual attribute can be#
%#   time, seasons, among others.                                    #
%#   Given a season, the temperature is anomaly if the sensor reading#
%#   is different from others in same season. The program will       #
%    uniformly select data instance (x, y), and add or minus y by    #
%    (366/2) days to find (x', y') to switch the sensor reading as   #
%#   anomlous data.                                                  #
%#                                                                   #
%#   [1] Song, Xiuyao, et al. "Conditional anomaly detection."       #
%#   Knowledge and Data Engineering, IEEE Transactions on 19.5       #
%#   (2007):631-645.                                                 #
%#####################################################################
perturbedData = data;
if nargin<2
    nop=10;
end
basic = floor(length(data)/nop);
perturbendIndex = (1: basic : length(data))';
numberOfAnomalies = length(perturbendIndex);
labels = zeros(length(data),1);
labels(perturbendIndex)=1;

for i=1:numberOfAnomalies
    perturbend = data(perturbendIndex(i),:);
    perturbendorDate =  data(mod(perturbendIndex(i)+8784,length(data))+1,1:3);
    rPerturbendorDate = repmat(perturbendorDate,size(data,1),1);    
    tempIndex=find(data(:,1) ==rPerturbendorDate(:,1)&data(:,2) ==rPerturbendorDate(:,2)&data(:,3) ==rPerturbendorDate(:,3));
    perturbendTime = perturbend(4);    
    if isempty(find(data(tempIndex,4)==repmat(perturbendTime,size(data(tempIndex),1),1)))
        continue;
    end
   perturbendorIndex = tempIndex(find(data(tempIndex,4)==repmat(perturbendTime,size(data(tempIndex),1),1)));
    perturbendor = data(perturbendorIndex,:);
    tempValue = perturbedData(perturbendIndex(i),6);
    perturbedData(perturbendIndex,6)=perturbendor(6);
    perturbedData(perturbendorIndex,6)=tempValue;
    labels(perturbendorIndex)=1;
end

end


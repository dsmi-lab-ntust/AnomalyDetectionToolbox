function [ scores ] = Example_kolmogorovEstimator(  )
%#####################################################################
%# Example of Kolmogorov Estimator                        #
%# Programers: Jing-Yao Lin                                          #
%#                                                                   #
%# Please send comments and suggestions to                           #
%# "jyl.ntust@gmail.com"                                             #
%#                                                                   #
%# Outputs                                                           #
%#   scores: the score indicates the anomalous-ness of the           #
%#   pfam testing sequence                                           #
%#                                                                   #
%#   This example will compute the anomalous-ness of the Pfam        #
%#   pretein sequences in testing set.                               #
%#                                                                   #
%#####################################################################

fid = fopen('..\benchmarks\CollectiveAnomaly\Pfam\PfamData_Normal');
pfamNormal = textscan(fid,'%s');
pfamNormal=pfamNormal{1};
fid = fopen('..\benchmarks\CollectiveAnomaly\Pfam\PfamData_Testing');
pfamTest = textscan(fid,'%s');
pfamTest=pfamTest{1};
fclose all;

[ scores ] = kolmogorovEstimator( pfamNormal,pfamTest );

end


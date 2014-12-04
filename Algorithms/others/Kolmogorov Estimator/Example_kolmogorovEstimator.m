function [ scores ] = Example_kolmogorovEstimator(  )
%#####################################################################
%# Example of Kolmogorov Estimator                                   #
%# Programmers: Jing-Yao Lin                                         #
%#                                                                   #
%# Please send comments and suggestions to                           #
%# "jyl.ntust@gmail.com"                                             #
%#                                                                   #
%# Outputs                                                           #
%#   scores: the score indicates the degree to which the Pfam testing#
%#   sequence is considered an anomaly                               #
%#                                                                   #
%#   This example will compute anomaly score for the Pfam            #
%#   protein sequences in the testing set.                           #
%#                                                                   #
%#####################################################################

fid = fopen('..\..\benchmarks\CollectiveAnomaly\Pfam\PfamData_Normal');
pfamNormal = textscan(fid,'%s');
pfamNormal=pfamNormal{1};
fid = fopen('..\..\benchmarks\CollectiveAnomaly\Pfam\PfamData_Testing');
pfamTest = textscan(fid,'%s');
pfamTest=pfamTest{1};
fclose all;
tic;
[ scores ] = kolmogorovEstimator( pfamNormal,pfamTest );
toc;
end


function [anomalous_or_not] = grubbs_test(A, alpha)
%##########################################################################
%# Grubb's test                                                           #                                                               #
%# Inputs                                                                 #
%#   A: the data vector (i.e. univariate data)                            #
%#   alpha: the significance level                                        #
%# Outputs                                                                #
%#   anomalous_or_not: a boolean vector declaring whether each instance is#
%#     or isn't an anomaly, according to the result of Grubb's test       #
%##########################################################################


N = length(A);

upper_critical_t_sq =tinv(1-alpha/(2*N),N-2)^2;
threshold = (N-1)/sqrt(N) * ...
            sqrt( upper_critical_t_sq / (N - 2 + upper_critical_t_sq) );
        
anomalous_or_not = abs(zscore(A)) > threshold;


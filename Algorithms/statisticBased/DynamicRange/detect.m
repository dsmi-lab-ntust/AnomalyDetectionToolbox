function [result]=detect(Mean, Var, x , Mul)
%This is dynamic range checking function
%
%Input
%	Mean	: average of previous data
%	Var     : variance of previous data
%	x		: new arriving data
%	Mul		: number of standard deviation
%
%Output
%	result	: detection result
%
    if Mul <= 0
	warning('Mul couldnt less than or equal to 0!');
	Mul = 1.5;
    end
    dim = size(x)
    result = zeros(dim(1), 1);
    result(x > ( Mean + Mul * sqrt(Var) ) || x < ( Mean - Mul * sqrt(Var) )) = 1 ;
end

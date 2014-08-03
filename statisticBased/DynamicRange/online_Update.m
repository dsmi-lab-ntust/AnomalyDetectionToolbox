function [Mean2, Var2] = online_Update(Mean, Var, x, n)
%Using this function to update mean and variance
%
%Input
%	Mean	: average of previous data
%	Var     : variance of previous data
%	x		: new arriving data
%	n		: number of previous data
%
%Output
%	Mean2	: result of average by online updating average with new data
%	Var2	: result of variance by online updating average with new data
%

	dim = size(Var);
	if n <= 0
		Mean = x;
		Var = ones(dim)*0.5;
	elseif n > 0
		Mean2 = ( n * Mean + x ) / ( n + 1);
		Var2 = max((( n * ( Var + Mean.^2 ) + x.^2 ) / (n + 1) - Mean2.^2),0);
	end
end

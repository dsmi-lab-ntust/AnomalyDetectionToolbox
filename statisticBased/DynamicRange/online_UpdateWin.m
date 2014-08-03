function [Mean2, Var2] = online_UpdateWin(Mean, Var, old_x, new_x, n)
%Using this function to update mean and variance
%
%Input
%	Mean	: average of previous data
%	Var     : variance of previous data
%	old_x	: oldest data in sliding window
%	new_x	: new arriving data
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
	else
		Mean2 = ( n * Mean - old_x + new_x ) / n;
		Var2 = max((( n * ( Var + Mean.^2 ) - old_x.^2 + new_x.^2 ) / n - Mean2.^2),0);
	end
end

function [best_so_far_dist, best_so_far_loc] = HOTSAX(data, n, strParam)
% 
% HOTSAX is used to find an anomaly (discord) in timeseries data.
% Based on the paper
% HOT SAX: Efficiently Finding the Most Unusual Time Series Subsequence
% Author    : Eamonn Keogh, Jessica Lin, Ada Fu
% Programmer : Po-Han Huang
% 
% [best_so_far_dist, best_so_far_loc] = HOTSAX(data, n);
% 
% Inputs 
%   data               [m x 1] : Input time series sequence.
%   n                  [1 x 1] : Sliding window size
%   strParam           [1 x 1] : parameters
%     .nseg            [1 x 1] : nseg is the number of symbols in the low
%                                dimensional approximation of the sub
%                                sequence while making symbols using SAX.
%     .a               [1 x 1] : alphabet size is the number of discrete
%                                symbols.
% 
% Outputs
%   best_so_far_dist   [1 x 1] : The best result(or can be consider as the
%                                 farthest distance in whole case).
%   best_so_far_loc    [1 x 1] : The location of the discord.
%

% setting up parameters
nseg = 3; alphabet_size = 3;
if nargin == 3
    [pInd, pVal] = strread(strParam, '%s%f', 'delimiter', ' ');
    for i=1:length(pInd)
        if(strcmp(pInd{i}, '-nseg'))
            nseg = pVal(i);
        elseif(strcmp(pInd{i}, '-a'))
            alphabet_size = pVal(i);
        end
    end
end

symbols = timeseries2symbol(data, n, nseg, alphabet_size, 1);

[set_map, set_index] = heuristic(symbols);

best_so_far_dist = 0;
best_so_far_loc  = NaN;

% ----making p sequence----------------------------------------------------
% the first element in p_seq is the mincount set
p_seq = [];
for map_idx = 1:size(set_map,1)
    p_seq = [p_seq; set_index{set_map(map_idx)}];
end
p_seq_size  = length(p_seq);
mc_set_size = 0;
for tmp_idx = 1:size(set_map,1)
    if length(set_index{set_map(tmp_idx)}) == length(set_index{set_map(1)})
        mc_set_size = mc_set_size + length(set_index{set_map(tmp_idx)});
    end
end
% after walk though the mincount set, random walk the rest
p_seq = [p_seq(1:mc_set_size);
         p_seq(randsample(1+mc_set_size:p_seq_size,p_seq_size-mc_set_size))];
% -------------------------------------------------------------------------

for p_idx = 1:size(p_seq) % ---------------------------------- % Outer Loop
    p = p_seq(p_idx);
    nearest_neighbor_dist = Inf;
    % ----making q sequence------------------------------------------------
    % the first element in q_seq is the set where p is in
    q_start_set = 0;
    for tmp_idx = 1:size(set_map)
        if sum(ismember(set_index{set_map(tmp_idx)},p)) > 0
            q_start_set = tmp_idx;
            break;
        end
    end
    q_seq = set_index{set_map(tmp_idx)};
    for map_idx = 1:size(set_map,1)
        if map_idx ~= q_start_set
            q_seq = [q_seq; set_index{set_map(map_idx)}];
        end
    end
    q_seq_size = length(q_seq);
    qs_set_size = length(set_index{set_map(q_start_set)}); % q start set size
    % after walk though the q start set, random walk the rest
    q_seq = [q_seq(1:qs_set_size);
             q_seq(randsample(1+qs_set_size:q_seq_size,q_seq_size-qs_set_size))];
    % ---------------------------------------------------------------------
 
    for q_idx = 1:size(q_seq) % -------------------------------% Inner Loop
        q = q_seq(q_idx);
        if abs(p-q) >= n %  check self match
            distance = norm(symbols(p,:) - symbols(q,:));
            if distance < best_so_far_dist
                if nearest_neighbor_dist == Inf
                    nearest_neighbor_dist = -1;
                end
                break;
            end
            if distance < nearest_neighbor_dist
                nearest_neighbor_dist = distance;
            end
        end
    end % ------------------------------------------------ % End Inner Loop
    if nearest_neighbor_dist > best_so_far_dist
        best_so_far_dist = nearest_neighbor_dist;
        best_so_far_loc  = p;
    end
end % ---------------------------------------------------- % End Outer Loop
if isnan(best_so_far_loc)
    disp('Can''t find anomaly');
end

function [set_map, set_index] = heuristic(symbols)
% =========================================================================
% Input -----
%   symbols     [m x n] : Result of SAX.
% -------------------------------------------------------------------------
% Outputs ----
%   set_map     [m x 1] : A sequence which can be sorted by the number of
%                         each kind of symbol set. The value can be the
%                         index of set_index.
%   set_index   [cell]  : The index_set where a symbol match in the
%                         original symbol input.
% =========================================================================
tmp_symbols = symbols;
count = []; set_index = {};
while ~isempty(tmp_symbols)
    symbol                         = tmp_symbols(1,:);
    match_index                    = find(ismember(symbols,symbol,'rows') == 1);
    set_index{size(set_index,2)+1} = match_index;
    count                          = [count; size(match_index,1)];
    
    unmatch_index                  = ismember(tmp_symbols,symbol,'rows') ~= 1;
    tmp_symbols                    = tmp_symbols(unmatch_index,:);
end
[~, set_map] = sort(count, 1);
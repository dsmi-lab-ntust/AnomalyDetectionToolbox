function [C, C_dist] = DC_Refinement(S_prefix, S_number, S_profix, C, C_index, r)
    C_dist = Inf(size(C, 1), 1);
    index = 0;
    for s=1:S_number
        file_name = strcat(S_prefix, int2str(s - 1), S_profix);
        S = dlmread(file_name, '\t');
        for i=1:size(S, 1)
            index = index + 1;
            C_number = size(C, 1);
            d = Inf(C_number, 1);
            for j=1:C_number
                if index ~= C_index(j, 1)
                    d(j, 1) = EarlyAbandon(S(i, :), C(j, :), C_dist(j, 1));
                end
            end
            find = d >= r;
            C = C(find, :);
            C_index = C_index(find, :);
            C_dist = min(C_dist, d);
            C_dist = C_dist(find, :);
        end
    end

function [d] = EarlyAbandon(Si, Cj, C_distj)
    upper_bound = C_distj * C_distj;
    d = 0;
    for k=1:size(Si, 2)
        diff = Si(1, k) - Cj(1, k);
        d = d + diff * diff;
        if d >= upper_bound
            %break;
        end
    end
    d = d ^ 0.5;
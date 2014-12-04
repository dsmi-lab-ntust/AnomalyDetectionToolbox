function [C C_index] = DC_Selection(S_prefix, S_number, S_profix, r)
    C = [];
    C_index = [];
    index = 0;
    for s=1:S_number
        file_name = strcat(S_prefix, int2str(s - 1), S_profix);
        S = dlmread(file_name, '\t');
        for i=1:size(S, 1)
            index = index + 1;
            if size(C, 1) == 0
                C = [C; S(i, :)];
                C_index = [C_index; index];
            else
                C_number = size(C, 1);
                dist = zeros(C_number, 1);
                for j=1:C_number
                    dist(j, 1) = norm(S(i, :) - C(j, :));
                end
                find = dist >= r;
                C = C(find, :);
                C_index = C_index(find, :);
                if size(C, 1) == C_number
                    C = [C; S(i, :)];
                    C_index = [C_index; index];
                end
            end
        end
    end
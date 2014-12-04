% Copyright and terms of use (DO NOT REMOVE):
% The code is made freely available for non-commercial uses only, provided that the copyright 
% header in each file not be removed, and suitable citation(s) (see below) be made for papers 
% published based on the code.
%
% The code is not optimized for speed, and we are not responsible for any errors that might
% occur in the code.
%
% The copyright of the code is retained by the authors.  By downloading/using this code you
% agree to all the terms stated above.
%
%   Lin, J., Keogh, E., Lonardi, S. & Chiu, B. 
%   "A Symbolic Representation of Time Series, with Implications for Streaming Algorithms." 
%   In proceedings of the 8th ACM SIGMOD Workshop on Research Issues in Data Mining and 
%   Knowledge Discovery. San Diego, CA. June 13, 2003. 
%
%
%   Lin, J., Keogh, E., Patel, P. & Lonardi, S. 
%   "Finding Motifs in Time Series". In proceedings of the 2nd Workshop on Temporal Data Mining, 
%   at the 8th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining. 
%   Edmonton, Alberta, Canada. July 23-26, 2002
%
% This function takes in a time series and convert it to string(s).
% There are two options:
%   1. Convert the entire time series to ONE string
%   2. Use sliding windows, extract the subsequences and convert these subsequences to strings
%
% For the first option, simply enter the length of the time series as "N"
%   ex. We have a time series of length 32 and we want to convert it to a 8-symbol string,
%       with alphabet size 3:
%       timeseries2symbol(data, 32, 8, 3)
% For the second option, enter the desired sliding window length as "N"
%   ex. We have a time series of length 32 and we want extract subsequences of length 32 using
%       sliding windows, and convert the subsequences to 8-symbol strings, with alphabet size 3:
%       timeseries2symbol(data, 16, 8, 3)
% 
%
% Input:
%   data              is the raw time series. 
%   N                 is the length of sliding window (use the length of the raw time series
%                     instead if you don't want to have sliding windows)
%   n                 is the number of symbols in the low dimensional approximation of the sub sequence.
%   alphabet_size     is the number of discrete symbols. 2 <= alphabet_size <= 10, although alphabet_size = 2 is a special "useless" case.
%   NR_opt            1: no numerosity reduction (record everything)
%                     2: numerosity reduction (record only if the string is different from the last recorded string)
%                        (default)
%                     3: advanced numerosity reduction (record only if the mindist between current string and 
%                        last recorded string > 0)
%                     4: more reduction (record only if the subsequence is NOT monotonic)
%
% Output:
%   symbolic_data:    matrix of symbolic data (no-repetition).  If consecutive subsequences
%                     have the same string, then only the first occurrence is recorded, with
%                     a pointer to its location stored in "pointers"
%   pointers:         location of the first occurrences of the strings
%
% N/n must be an integer, otherwise the program will give a warning, and abort.
%
% The variable "win_size" is assigned to N/n, this is the number of data points on the raw 
% time series that will be mapped to a single symbol, and can be imagined as the 
% "compression rate".
%
% The symbolic data is returned in "symbolic_data", with pointers to the subsequences  
%
%
% 
%
% Copyright (c) 2003, Eamonn Keogh, Jessica Lin, Stefano Lonardi, Pranav Patel.  All rights reserved.
%
function [symbolic_data, pointers] =  timeseries2symbol(data, N, n, alphabet_size, NR_opt)

if nargin < 4
    disp('usage: sax_modified(data, window_len, num_segment, alphabet_size, [numerosity_reduction_option]');
    return;
end

%if (N/n - floor(N/n))                               % N/n must be an integer.
%    disp('N/n must be an integer. Aborting '); , return;  
%end; 

if alphabet_size > 20
    disp('Currently alphabet_size cannot be larger than 20.  Please update the breakpoint table if you wish to do so');
    return;
end

if nargin < 5
    NR_opt = 2;
end

win_size      = floor(N/n);                         % win_size is the number of data points on the raw time series that will be mapped to a single symbol

pointers      = [];                                 % Initialize pointers,
symbolic_data = zeros(1,n);                         % Initialize symbolic_data with a void string, it will be removed later.
all_string    = zeros(length(data)-N+1,n);

% Scan across the time series extract sub sequences, and converting them to strings.
for i = 1 : length(data) - (N -1)                                       
    
    if mod(i, 1000) == 0
        %disp(num2str(i));
    end
    
    % Remove the current subsection.
    sub_section = data(i:i + N -1); 
    
    % Z normalize it.
    sub_section = (sub_section - mean(sub_section))/std(sub_section);     
    
    % take care of the special case where there is no dimensionality reduction
    if N == n
        PAA = sub_section;
        
    % N is not dividable by n
    else
        if (N/n - floor(N/n))                               
            temp = zeros(n, N);
            for j = 1 : n
                temp(j, :) = sub_section;
            end
            expanded_sub_section = reshape(temp, 1, N*n);
            PAA = [mean(reshape(expanded_sub_section, N, n))];
        % N is dividable by n
        else                                                
            PAA = [mean(reshape(sub_section,win_size,n))];
        end
    % Convert to PAA.    
    %else
   %     PAA = [mean(reshape(sub_section,win_size,n))];                     
    end
    
    current_string = map_to_string(PAA,alphabet_size);          % Convert the PAA to a string. 

    % no numerosity reduction: record everything
    if NR_opt == 1
        symbolic_data    = [symbolic_data; current_string];     % ... add it to the set...
        pointers         = [pointers ; i];                      % ... and add a new pointer.
    
    % with numerosity reduction: record a string only if it differs from its leftmost neighbor
    elseif NR_opt == 2
        
        if ~all(current_string == symbolic_data(end,:))             % If the string differs from its leftmost neighbor...
            symbolic_data    = [symbolic_data; current_string];     % ... add it to the set...
            pointers         = [pointers ; i];                      % ... and add a new pointer.
        end;
        
    % advanced numerosity reduction: record a string only if its mindist to the last recorded
    % string > 0
    elseif NR_opt == 3

        % always record the first string
        if i == 1
            symbolic_data    = [symbolic_data; current_string];     % ... add it to the set...
            pointers         = [pointers ; i];                      % ... and add a new pointer.

        % subsequent strings
        else
            
            % we only need to check if two sliding windows have different strings (if they are
            % the same then their mindist is 0)
            if ~all(current_string == symbolic_data(end,:))            % If the string differs from its leftmost neighbor...        
            
                % Here we're doing a simplified version of mindist. Since we're only interested
                % in knowing if the distance of two strings is 0, we can do so without any extra
                % computation.  Since only adjacent symbols have distance 0, all we have to
                % do is check if any two symbols are non-adjacent.
                if any(abs(symbolic_data(end,:) - current_string) > 1)
                    symbolic_data    = [symbolic_data; current_string];     % ... add it to the set...
                    pointers         = [pointers ; i];                      % ... and add a new pointer.
                end
            end
        end
    
    else
      
              
        % we only need to check if two sliding windows have different strings (if they are
        % the same then their mindist is 0)
        if ~all(current_string == symbolic_data(end,:))            % If the string differs from its leftmost neighbor...        
            if any(abs(symbolic_data(end,:) - current_string) > 1)
                if ~all(sign(diff(current_string)) >= 0) && ~all(sign(diff(current_string)) <= 0)
                    symbolic_data    = [symbolic_data; current_string];     % ... add it to the set...
                    pointers         = [pointers ; i];                      % ... and add a new pointer.
                end
            end
        end
    end    
    
end;
% Delete the first element, it was just used to initialize the data structure
symbolic_data(1,:) = [];                                               

%--------------------------------------------------------------------------------------------------------------------------------------------------------
%----------------Local Functions----------------------Local Functions----------------Local Functions----------------------Local Functions----------------
%--------------------------------------------------------------------------------------------------------------------------------------------------------

function string = map_to_string(PAA,alphabet_size)

string = zeros(1,length(PAA));

switch alphabet_size
        case 2, cut_points  = [-inf 0];
        case 3, cut_points  = [-inf -0.43 0.43];
        case 4, cut_points  = [-inf -0.67 0 0.67];
        case 5, cut_points  = [-inf -0.84 -0.25 0.25 0.84];
        case 6, cut_points  = [-inf -0.97 -0.43 0 0.43 0.97];
        case 7, cut_points  = [-inf -1.07 -0.57 -0.18 0.18 0.57 1.07];
        case 8, cut_points  = [-inf -1.15 -0.67 -0.32 0 0.32 0.67 1.15];
        case 9, cut_points  = [-inf -1.22 -0.76 -0.43 -0.14 0.14 0.43 0.76 1.22];
        case 10, cut_points = [-inf -1.28 -0.84 -0.52 -0.25 0. 0.25 0.52 0.84 1.28];
        case 11, cut_points = [-inf -1.34 -0.91 -0.6 -0.35 -0.11 0.11 0.35 0.6 0.91 1.34];
        case 12, cut_points = [-inf -1.38 -0.97 -0.67 -0.43 -0.21 0 0.21 0.43 0.67 0.97 1.38];
        case 13, cut_points = [-inf -1.43 -1.02 -0.74 -0.5 -0.29 -0.1 0.1 0.29 0.5 0.74 1.02 1.43];
        case 14, cut_points = [-inf -1.47 -1.07 -0.79 -0.57 -0.37 -0.18 0 0.18 0.37 0.57 0.79 1.07 1.47];
        case 15, cut_points = [-inf -1.5 -1.11 -0.84 -0.62 -0.43 -0.25 -0.08 0.08 0.25 0.43 0.62 0.84 1.11 1.5];
        case 16, cut_points = [-inf -1.53 -1.15 -0.89 -0.67 -0.49 -0.32 -0.16 0 0.16 0.32 0.49 0.67 0.89 1.15 1.53];
        case 17, cut_points = [-inf -1.56 -1.19 -0.93 -0.72 -0.54 -0.38 -0.22 -0.07 0.07 0.22 0.38 0.54 0.72 0.93 1.19 1.56];
        case 18, cut_points = [-inf -1.59 -1.22 -0.97 -0.76 -0.59 -0.43 -0.28 -0.14 0 0.14 0.28 0.43 0.59 0.76 0.97 1.22 1.59];
        case 19, cut_points = [-inf -1.62 -1.25 -1 -0.8 -0.63 -0.48 -0.34 -0.2 -0.07 0.07 0.2 0.34 0.48 0.63 0.8 1 1.25 1.62];
        case 20, cut_points = [-inf -1.64 -1.28 -1.04 -0.84 -0.67 -0.52 -0.39 -0.25 -0.13 0 0.13 0.25 0.39 0.52 0.67 0.84 1.04 1.28 1.64];
        otherwise disp('Error! alphabet_size is too big');           
end;
        
for i = 1 : length(PAA)    
    string(i) = sum( (cut_points <= PAA(i)), 2 );         % order is now: a = 1, b = 2, c = 3..
end; 
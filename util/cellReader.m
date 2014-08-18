function [ seqCell ] = cellReader( fileDest )
% This tool can used to parse sequences with different lengh which is stored 
% as csv format.
% 
% Inputs                                                            
%   fileDest: Location of the csv file.
% 
% Example:
% [ seqCell ] = cellReader( 'data.csv' )
    seqCell=cell(1,1);
    fID = fopen(fileDest);
    seqStr = fgets(fID);
    i=1;
    while ischar(seqStr)       
        seqCell{i,1} =str2num(seqStr);
        seqStr = fgets(fID);
        i=i+1;
    end
    fclose(fID);


end


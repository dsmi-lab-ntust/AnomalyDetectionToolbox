function [ scores ] = kolmogorovEstimator( normalDataCell,unseenDataCell )
%
% Kolmogorov Estimator                                              
% Programmers: Jing-Yao Lin                                         
%                                                                   
% Please send comments and suggestions to                           
% "jyl.ntust@gmail.com"                                             
%                                                                   
% Inputs                                                            
%   normalDataCell: Cell of normal symbolic sequences               
%   unseenDataCell: Cell of unseen symbolic sequences               
%                                                                   
% Outputs                                                           
%   scores: the score indicates the anomalous-ness of the           
%   unseen sequence                                                 
%                                                                   
% Example:                                                          
%   PointAnomalyGen( normalDataCell,unseenDataCell);                
%                                                                   
%   Kolmogorov complexity indicates the possible shortest length of 
%   compressed representation of language. Assume the string length 
%   LZ77 represents the Kolmogorov complexity of a symbolic         
%   sequence, the Kolmogorov complexity will be greater after       
%   an anomalous symbolic sequence joins the regular symbolic       
%   sequence family. The output score then indicates the            
%   anomalous-ness of a unseen sequence.                            
%                                                                   
%


 scores = zeros(size(unseenDataCell,1),1); 
 normalSeq = strcat(normalDataCell{:}); 
 normalSeq_Z = dzip(normalSeq);
 infor_o = whos('normalSeq_Z'); 
 for i = 1:size(unseenDataCell,1)     
     if iscell(unseenDataCell)
         targetSeq = [normalSeq  unseenDataCell{i}];
     else
         targetSeq = [normalSeq  unseenDataCell];
     end
     
     targetSeq_Z = dzip(targetSeq);
     infor_u = whos('targetSeq_Z'); 
     tempScores=infor_u.bytes-infor_o.bytes;      
     
     if iscell(unseenDataCell)
         tempScores=tempScores/size(unseenDataCell{i},2);
     else
         tempScores=tempScores/size(unseenDataCell,2);
     end
     scores(i) = tempScores; 
 end
 


end


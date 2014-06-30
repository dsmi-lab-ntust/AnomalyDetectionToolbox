function [ normalSeqCell ,unseenSeqCell] = SSSDGen( nn,nu,seqLength,abnormalRatio,varOfGaussian )


if nargin <4
    abnormalRatio=0.5;
end
if nargin <5
    varOfGaussian=1;
end
varOfGaussian

normalSeq = normrnd(0,varOfGaussian,nn,seqLength);
minV = min(min(normalSeq));
normalSeq=normalSeq-minV;
maxV = max(max(normalSeq));
((123-97)/(maxV))
normalSeq=(normalSeq.*((122-97)/(maxV)))+97;
normalSeq(find(normalSeq==123))=122;
normalSeqCell= cellstr(char(int32(normalSeq)));

unseennormalSeq = normrnd(0,varOfGaussian,nu*(1-abnormalRatio),seqLength);
minV = min(min(unseennormalSeq));
unseennormalSeq=unseennormalSeq-minV;
maxV = max(max(unseennormalSeq));
((123-97)/(maxV))
unseennormalSeq=(unseennormalSeq.*((122-97)/(maxV)))+97;
unseennormalSeq(find(unseennormalSeq==123))=122;
unseennormalSeqCell= cellstr(char(int32(unseennormalSeq)))


unseenabnormalSeq = rand(nu*(abnormalRatio),seqLength).*(122-97)+97;
unseenabnormalSeq(find(unseenabnormalSeq==123))=122;
unseenabnormalSeqCell= cellstr(char(int32(unseenabnormalSeq)))
unseenSeqCell=[unseennormalSeqCell;unseenabnormalSeqCell];
end


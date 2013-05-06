function [NG,NGI,NGL]=ngrams2(n,FILE,TI,TL)
% Extracts n-grams from a text file
%     NG : output
%      n : n-gram length
%   FILE : input text file

NG=[];
s=size(FILE,2);
for i=n-1:-1:0
    NG=[NG FILE(1,n-i:s-i)'];
end
NG=sort(NG')';
NGI=TI(1:size(TI,2)-n+1);
NGL=TI(n:size(TI,2))+TL(n:size(TI,2))-NGI;

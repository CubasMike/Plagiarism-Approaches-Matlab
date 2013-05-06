function [T,II,LL]=score_sentence(Y)
temp=textscan(Y,'%s','Delimiter','.');
T=temp{1,1}(~ismember(temp{1,1},''));
I=strfind(Y,'.');
L(1,1)=I(1,1)-1;
L(2:size(I,2))=I(2:size(I,2))-I(1:size(I,2)-1)-1;
LL=L(~ismember(L,0));
II=I(~ismember(L,0))-LL;
end
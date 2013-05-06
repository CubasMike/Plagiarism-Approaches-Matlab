function [T,II,LL]=score(Y,op)
temp=textscan(Y,'%s');
T=temp{1,1}(~ismember(temp{1,1},''));
if op==0
    I=strfind(Y,' ');
    L(1,1)=I(1,1)-1;
    L(2:size(I,2))=I(2:size(I,2))-I(1:size(I,2)-1)-1;
    LL=L(~ismember(L,0));
    II=I(~ismember(L,0))-LL;
else
    II=0;
    LL=0;
end
end
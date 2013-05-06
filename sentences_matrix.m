function [sents_v,sr]=sentences_matrix(sents,V)
sents_v=zeros(size(sents,1),size(V,1));
sw=flist;
sr=true(size(sents,1),1);
for i=1:size(sents,1)
    temp=sort(score(sents{i,1},1))';
    %Removing the 50 more common stopwords
    temp=temp(~ismember(temp,sw));
    %Calculating tf
    if size(temp,2)>4%Sentences with more than 4 words
        [a,m1]=unique(temp,'first');
        [b,n1]=unique(temp,'last');
        sents_v(i,ismember(V,a))=n1-m1+1;
    else
        sr(i)=false;
    end
end
sents_v=sents_v(sr,:);
end
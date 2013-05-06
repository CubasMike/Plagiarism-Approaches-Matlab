function [sents_v,sr]=sentences_matrix_sparse(sents,V)
sw=flist;
sr=true(size(sents,1),1);
sents_v=[];
for i=1:size(sents,1)
    temp=sort(score(sents{i,1},1))';
    %Removing the 50 more common stopwords
    temp=temp(~ismember(temp,sw));
    %Calculating tf
    if size(temp,2)>4%Sentences with more than 4 words
        [a,m1]=unique(temp,'first');
        [b,n1]=unique(temp,'last');
        temp2=zeros(1,size(V,1));
        temp2(1,ismember(V,a))=n1-m1+1;
        sents_v=[sents_v;sparse(temp2)];
    else
        sr(i,1)=false;
    end
end
end
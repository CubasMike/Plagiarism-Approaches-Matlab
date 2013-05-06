function X=transform_sentence2(X)

delimiters=[',-()''"?!;«»·_[]*+/&',9,10,32,65279];
delimiters=double(delimiters);

X=lower(X);

for i=1:size(delimiters,2)
    %I=find(X==delimiters(1,i));
    I=ismember(X,delimiters(1,i));
    X(I)=' ';
end
delimiters2=[13];
for i=1:size(delimiters2,2)
    %I=find(X==delimiters(1,i));
    I=ismember(X,delimiters2(1,i));
    X(I)='.';
end
X=regexprep(X,'(\d+)\.(\d+)','$1,$2');
X=regexprep(X,'(\s[a-z])\.|(dr)\.|(mr)\.','$1_');
X=[' ',X,'.'];
function X=transform(X)

delimiters=[',.-()''"?!;«»·_[]*+/&',13,10,9,32,65279];
delimiters=double(delimiters);

X=lower(X);

for i=1:size(delimiters,2)
    %I=find(X==delimiters(1,i));
    I=ismember(X,delimiters(1,i));
    X(I)=' ';
end

X=[' ',X,' '];
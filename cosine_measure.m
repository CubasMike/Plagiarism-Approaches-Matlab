function [r,c]=cosine_measure(os_v,ss_v)
    cm=zeros(size(os_v,1),size(ss_v,1));
    num=os_v*ss_v';
    den=sqrt(sum(os_v.*os_v,2)*sum(ss_v.*ss_v,2)');
    non_zero=find(den);
    cm(non_zero)=num(non_zero)./den(non_zero);
    [r,c]=find(cm>0.50);
    %[c,y]=unique(c,'first');
    %r=r(y);
end
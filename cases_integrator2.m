function plags=cases_integrator2(r,c,oi,ol,si,sl)
plags=[];
gsd=[0;diff(c)<2;0];
lsi=strfind(gsd',[0 1]);
lss=strfind(gsd',[1 0]);
display(size(lsi,2))
for i=1:size(lsi,2)
    [temp,index]=sort(r(lsi(i):lss(i)));
    god=[0;diff(temp)<2;0];
    loi=strfind(god',[0 1]);
    los=strfind(god',[1 0]);
    for j=1:size(loi,2)
        plags=[plags;oi(r(index(loi(j))))-3 sum(ol(r(index(loi(j))):r(index(los(j))))) si(c(lsi(i)))-2 sum(sl(c(lsi(i)):c(lss(i))))];
    end
end
end
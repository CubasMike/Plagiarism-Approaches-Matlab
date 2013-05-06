%% 5-gram approach
prev=slCharacterEncoding('utf8');
t1=clock();
source_document='source-document00178.txt';
suspicious_document='suspicious-document00005.txt';
DIR='D:\CIC\Research visit Greece\pan-plagiarism-corpus-2011\external-detection-corpus\';
od=fileread([DIR 'source-document\' source_document]);
sd=fileread([DIR 'suspicious-document\' suspicious_document]);
od=transform(od);
sd=transform(sd);
[ow,owi,owl]=score(od,0);
[sw,swi,swl]=score(sd,0);
v=unique([ow;sw]);
[x,owid]=ismember(ow,v);
[x,swid]=ismember(sw,v);
[ong,ongi,ongl]=ngrams2(5,owid',owi,owl);
[sng,sngi,sngl]=ngrams2(5,swid',swi,swl);
[scf,ocf]=ismember(sng,ong,'rows');
cf=[find(scf) ocf(find(ocf))];
scf_int=diff(cf(:,1))<50;
scf_int=[0;scf_int;0];
scf_int_inits=strfind(scf_int',[0,1,1]);
scf_int_ends=strfind(scf_int',[1,1,0]);
D=[];
plags=[];
for i=1:size(scf_int_inits',1)
    corr_ocf=sort(cf(scf_int_inits(i):scf_int_ends(i)+1,2));
    ocf_int=[0;abs(diff(corr_ocf))<100;0];
    ocf_int_inits=strfind(ocf_int',[0,1,1]);
    ocf_int_ends=strfind(ocf_int',[1,1,0]);
    disp(['Subregions: ' int2str(size(ocf_int_inits,2)),' - ', int2str(size(ocf_int_ends,2))])
    for j=1:size(ocf_int_inits,2)
        D=[D;corr_ocf(ocf_int_inits(j),1) corr_ocf(ocf_int_ends(j)+1,1) cf(scf_int_inits(i),1) cf(scf_int_ends(i)+1,1)];
        plags=[plags;ongi(corr_ocf(ocf_int_inits(j),1)) ongi(corr_ocf(ocf_int_ends(j)+1,1))-ongi(corr_ocf(ocf_int_inits(j),1))+ongl(corr_ocf(ocf_int_ends(j)+1,1)) ...
            sngi(cf(scf_int_inits(i),1)) sngi(cf(scf_int_ends(i)+1,1))-sngi(cf(scf_int_inits(i),1))+sngl(cf(scf_int_ends(i)+1,1))];
    end
end
display(D);
display(plags);

t2=clock();
tiempo=etime(t2,t1);
display(tiempo);
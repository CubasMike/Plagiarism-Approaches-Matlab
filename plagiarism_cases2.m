function plags=plagiarism_cases2(r,c,oi,ol,si,sl)
plags=[];
sents_s=[];
sents_o=[];
index_s=1;
for i=1:size(c,1)
    if isempty(sents_s)
        sents_s(1,1)=c(i,1);
        sents_o(1,1)=r(i,1);
    elseif c(i,1)==sents_s(end)+1 || c(i,1)==sents_s(end)
        sents_s=[sents_s;c(i,1)];
        sents_o=[sents_o;r(i,1)];
    else
        sents_o_int=[];
        plalen_o=0;
        plalen_s=0;
        plaoffset_o=0;
        plaoffset_s=0;
        for k=1:size(sents_s,1)
            if ismember(sents_o(k),sents_o_int)
                plalen_o=plalen_o+ol(1,sents_o(k));
                plalen_s=plalen_s+sl(1,sents_s(k));
                if oi(1,sents_o(k))<plaoffset_o
                %if sents_o(k)<plaoffset_o
                    plaoffset_o=oi(1,sents_o(k));
                    %plaoffset_o=sents_o(k);
                end
            else
                if ~isempty(sents_o_int)
                    plags=[plags;[plaoffset_o-3 plalen_o plaoffset_s-2 plalen_s]];
                    %plags=[plags;[plaoffset_o plalen_o plaoffset_s plalen_s]];
                    index_s=k;
                end
                plaoffset_o=oi(1,sents_o(k));
                plaoffset_s=si(1,sents_s(k));
                plalen_o=ol(1,sents_o(k));
                plalen_s=sl(1,sents_s(k));
                %plaoffset_o=sents_o(k);
                %plaoffset_s=sents_s(k);
                sents_o_int=sents_interval(sents_o,index_s);
            end
        end
        plags=[plags;[plaoffset_o-3 plalen_o plaoffset_s-2 plalen_s]];
        %plags=[plags;[plaoffset_o plalen_o plaoffset_s plalen_s]];
        index_s=1;
        sents_s=[];
        sents_o=[];
        sents_s(1,1)=c(i,1);
        sents_o(1,1)=r(i,1);
    end
end
sents_o_int=[];
plalen_o=0;
plalen_s=0;
plaoffset_o=0;
plaoffset_s=0;
for k=1:size(sents_s,1)
    if ismember(sents_o(k),sents_o_int)
        plalen_o=plalen_o+ol(1,sents_o(k));
        plalen_s=plalen_s+sl(1,sents_s(k));
        if oi(1,sents_o(k))<plaoffset_o
        %if sents_o(k)<plaoffset_o
            plaoffset_o=oi(1,sents_o(k));
            %plaoffset_o=sents_o(k);
        end
    else
        if ~isempty(sents_o_int)
            plags=[plags;[plaoffset_o-3 plalen_o plaoffset_s-2 plalen_s]];
            %plags=[plags;[plaoffset_o plalen_o plaoffset_s plalen_s]];
            index_s=k;
        end
        plaoffset_o=oi(1,sents_o(k));
        plaoffset_s=si(1,sents_s(k));
        plalen_o=ol(1,sents_o(k));
        plalen_s=sl(1,sents_s(k));
        %plaoffset_o=sents_o(k);
        %plaoffset_s=sents_s(k);
        sents_o_int=sents_interval(sents_o,index_s);
    end
end
plags=[plags;[plaoffset_o-3 plalen_o plaoffset_s-2 plalen_s]];
%plags=[plags;[plaoffset_o plalen_o plaoffset_s plalen_s]];

function sents_o_int=sents_interval(sents_o,index_s)
[sents_o_sorted,index_o]=sort(sents_o);
%Consecutive plagiarized source sentences interval
sents_o_int=sents_o(index_s,1);
%Way up
for j=find(sents_o_sorted==sents_o(index_s,1),1,'first')-1:-1:1
    if sents_o_sorted(j)==sents_o_int(1)-1 || sents_o_sorted(j)==sents_o_int(1)
        sents_o_int=[sents_o_sorted(j) sents_o_int];
    else
        break;
    end
end
%Way down
for j=find(sents_o_sorted==sents_o(index_s,1),1,'first')+1:1:size(sents_o_sorted,1)
    if sents_o_sorted(j)==sents_o_int(end)+1 || sents_o_sorted(j)==sents_o_int(end)
        sents_o_int=[sents_o_int sents_o_sorted(j)];
    else
        break;
    end
end
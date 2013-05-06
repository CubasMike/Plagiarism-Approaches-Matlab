%% Sentece approach
prev=slCharacterEncoding('utf8');
t1=clock();
source_document='source-document06022.txt';
suspicious_document='suspicious-document00007.txt';
DIR='D:\CIC\Research visit Greece\pan-plagiarism-corpus-2011\external-detection-corpus\';
o_doc=fileread([DIR 'source-document\' source_document]);
s_doc=fileread([DIR 'suspicious-document\' suspicious_document]);
%Sentence tokenization
od=transform_sentence2(o_doc);
sd=transform_sentence2(s_doc);
%Vocabulary used in both texts
V=unique([score(transform2(od),1);score(transform2(sd),1)]);
%Sentence tokenization
[os,oi,ol]=score_sentence(od);
[ss,si,sl]=score_sentence(sd);
%Word tokenization, term frequency calculation and preprocessing by
%sentence
[os_v,rs_o]=sentences_matrix(os,V);
[ss_v,rs_s]=sentences_matrix(ss,V);
%Comparison between all the sentences in both texts
[r,c]=cosine_measure(os_v,ss_v);
plags=plagiarism_cases(r,c,oi(rs_o'),ol(rs_o'),si(rs_s'),sl(rs_s'));
t2=clock();
tiempo=etime(t2,t1);
display(tiempo);
function [r,c]=cosine_measure_sparse(os_v,ss_v)
    cm=(os_v*ss_v')./sqrt(sum(os_v.*os_v,2)*sum(ss_v.*ss_v,2)');
    [r,c]=find(cm>0.50);
end
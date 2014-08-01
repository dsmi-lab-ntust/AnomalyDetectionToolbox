function process(data, label, k, threshold)
    
    s_d = size(data);
    fprintf('k: %d, threshold: %f', k, threshold);
    tic
    [suspicious_index lof] = LOF(data, k);
    toc
    TPR = sum(lof>=threshold & label==1) / sum(label==1);
    TNR = sum(lof<threshold & label==0) / sum(label==0);
    ACC = (TPR*sum(label==1) + TNR*sum(label==0)) / s_d(1);
    fprintf('TPR: %f, TNR: %f, ACC: %f\n', TPR, TNR, ACC);
end

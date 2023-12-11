function display_query_result(net,test_set,train_features_normalize,test_features_normalize,query_nocrop_features_normalize,gnd,qe,dis)

for m=1:7
    dim=8*2^(m-1);


    %%%%%%%% Hybrid PCA-whitening
    [HPWtest_features_pca,HPWquery_nocrop_features_pca]=Hy_whitening(train_features_normalize,test_features_normalize,query_nocrop_features_normalize,dim,'HW');

    %%%%%%%% PCA-whitening
    [PW_test_features_pca,PW_query_nocrop_features_pca]=Hy_whitening(train_features_normalize,test_features_normalize,query_nocrop_features_normalize,dim);



    dist=pdist2(HPWtest_features_pca,HPWquery_nocrop_features_pca,dis);
    [~, HPWcrop_ranks] = sort(dist, 'ascend');
    [HPWnocrop_map,~] = compute_map (HPWcrop_ranks, gnd);


    [ranks_QE] = rank_qe(HPWtest_features_pca', HPWquery_nocrop_features_pca', HPWcrop_ranks,qe);
    [HPWnocrop_qe_map,~] = compute_map (ranks_QE, gnd);


    PW_dist=pdist2(PW_test_features_pca,PW_query_nocrop_features_pca,dis);
    [~, PW_ranks] = sort(PW_dist, 'ascend');
    [PWnocrop_map,~] = compute_map (PW_ranks, gnd);

    [ranks_QE] = rank_qe(PW_test_features_pca', PW_query_nocrop_features_pca', PW_ranks,qe);
    [PWnocrop_qe_map,~] = compute_map (ranks_QE, gnd);


    fprintf(['>> %s: %s: %d dim:\n  ' ...
        ' nocrop:HPWnocrop_map:%.4f,HPWnocrop_qe_map:%.4f,PWnocrop_map:%.4f,PWnocrop_qe_map:%.4f\n\n'], net,test_set, dim, ...
        HPWnocrop_map,HPWnocrop_qe_map,PWnocrop_map,PWnocrop_qe_map);

end

end

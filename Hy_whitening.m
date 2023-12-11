function [test_features_pca,query_features_pca] = Hy_whitening(train_features_normalize,test_features_normalize,query_features_normalize,dim,HW)

if nargin==5
    %%% Hybrid PCA-whitening
    [test_features,coeff,mu,u,s]= pca_and_whitening(train_features_normalize,test_features_normalize,size(test_features_normalize,2));
    test_features_pca=normalize(test_features,2,"norm");

    if max(size(test_features_normalize))>10000

        [oxford_feature1,coeff1,mu1,u1,s1,~] = pca_and_whitening(test_features_normalize,test_features_normalize,dim);
        oxford_feature_pca1=normalize(oxford_feature1,2,"norm");
        idx=dim;
    else
        [oxford_feature1,coeff1,mu1,u1,s1,idx] = pca_and_whitening(test_features_normalize,test_features_normalize);
        oxford_feature_pca1=normalize(oxford_feature1,2,"norm");
    end

    %%%
    test_features_pca=[test_features_pca oxford_feature_pca1];
    XTrain=normalize(test_features_pca,2,"norm");
    [coeff11,scoreTrain11,~,~,~,mu11]=pca(XTrain);
    test_features_pca=scoreTrain11(:,1:dim);
    test_features_pca=normalize(test_features_pca,2,"norm");


    %%%
    q_features=normalize(query_features_normalize,2,"norm");
    query_features_white=query_pca(q_features,coeff,mu,u,s,size(query_features_normalize,2));
    query_features_pca=normalize(query_features_white,2,"norm");

    q_features=normalize(query_features_normalize,2,"norm");
    query_features_white=query_pca(q_features,coeff1,mu1,u1,s1,idx);
    query_feature_pca1=normalize(query_features_white,2,"norm");

    query_features_pca=[query_features_pca query_feature_pca1];
    query_features_pca=normalize(query_features_pca,2,"norm");
    q_features=(query_features_pca-mu11)*coeff11;
    query_features_pca=q_features(:,1:dim);
    query_features_pca=normalize(query_features_pca,2,"norm");


else
    %%%%%%  PCA-whitening

    [test_features,coeff,mu,u,s]= pca_and_whitening(train_features_normalize,test_features_normalize,dim);
    test_features_pca=normalize(test_features,2,"norm");
    q_features=normalize(query_features_normalize,2,"norm");
    query_features_white=query_pca(q_features,coeff,mu,u,s,dim);
    query_features_pca=normalize(query_features_white,2,"norm");
end
end




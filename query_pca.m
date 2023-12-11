function query_features_white = query_pca(q_features,coeff,mu,u,s,d)
q_features=(q_features-mu)*coeff;
q_test=q_features(:,1:d);

q_xRot=q_test*u;

epsilon=1*10^(-5);
q_xPCAWhite=diag(1./(sqrt(diag(s)+epsilon)))*q_xRot';
query_features_white=q_xPCAWhite';

end

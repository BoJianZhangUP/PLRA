function [oxford_feature,coeff,mu,u,s,idx] = pca_and_whitening(XTrain1,XText,d)

[coeff,scoreTrain,~,~,explained,mu]=pca(XTrain1);

sum_explained = 0;
idx = 0;
while sum_explained < 80
    idx = idx + 1;
    sum_explained = sum_explained + explained(idx);
end
if nargin==2
    d=idx;
end

x_train=scoreTrain(:,1:d);

sigma=cov(x_train,'omitrows');
[u,s,~]=svd(sigma);

scoreTest=(XText-mu)*coeff;
x_test=scoreTest(:,1:d);


xRot=x_test*u;

epsilon=1*10^(-5);
xPCAWhite=diag(1./((diag(s)+epsilon).^(1/2)))*xRot';
oxford_feature=xPCAWhite';

end
function new_X = change_weight(X,index)

[~,~,N] = size(X);
new_X=X;
X_summ =0;
for i=1:N
    nzsum = ceil(sqrt(N+i));
    X_summ =  X_summ+i;
    new_X(:,:,i)=X(:,:,index(i));
    new_X(:,:,i)=min(1,((nzsum)/(i))^i).*new_X(:,:,i);

end

end
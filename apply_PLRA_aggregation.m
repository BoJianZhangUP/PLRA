function features = apply_PLRA_aggregation(X,index,g_num)

[~,~,K] = size(X);
features=zeros(1,K);
X11=change_weight(X,index);
S1=sum(X11,3);

for j=1:g_num

    S = compute_spatial_weight(S1,j);
    X1 = X.*S;
    S1=sum(X11,3)+sum(change_weight(X1,index),3);

    C=compute_channel_weight(X1);
    C=permute(C,[1,3,2]);
    X1=X1.*C;

    X1 = reshape(sum(X1,[1,2]),[1,K]);
    rst = X1;
    features=features+rst;
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rst= compute_spatial_weight(S1,j)

[x,y]=get_point(S1,j);
rst1=multi_region_Gaussian(S1,x,y);
rst=rst1.*S1;
z = sum(sum(rst.^2))^(1/2);
rst = (rst/z).^(1/2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function channel_wt = compute_channel_weight(X1)

[~,~,K] = size(X1) ;
e=1*10^(-5);
X_sum =reshape(sum(X1,[1,2]),[1,K]);
X_sum=((X_sum));
channel_wt = log((sum(X_sum.^2))./((X_sum).^2+e));
end

function var_index = rand_sum_sorting(files,k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num=size(files,1);
R=randperm(num,round(num*k));
m=size(R,2);
sum_pool5=[];
n=floor(num*k);
parfor i=1:n-1
    if i==1
        j=1;
    else
        j=round(i*(1/k));
    end
    files_path=[files(j).folder,'\',files(j).name];
    pool5 = importdata(files_path);
    [~,~,channel] = size(pool5);

    var1 = reshape(var(pool5,0,[1 2]),[1,channel]);

    sum_pool5=[sum_pool5;var1];

end
var_pool5=sum(sum_pool5);

[~, var_index] = sort(var_pool5,'descend');
end
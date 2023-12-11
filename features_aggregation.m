function features=features_aggregation(files,list,index,g_num)
features=[];

size(files,1)
parfor i=1:size(files,1)
    path=[files(i).folder,'\',list{i},'.mat'];
    pool5 = importdata(path);

    feature = apply_PLRA_aggregation(pool5,index,g_num);

    features = [features;feature];
    if mod(i,1000) == 0
        i
    end

end

end

clc;clear;
% parameters seting
net='vgg16';
datapath='..\data\';
image_num='1';
qe=10;
k=0.1;    % Number of image
g_num=5;  % Number of Gaussiuan points

dis='euclidean';  %

switch image_num
    case {'5'}
        train_set='paris6k';
        test_set='oxford5k';
        query_set='oxford5k';
    case {'6'}
        train_set='oxford5k';
        test_set='paris6k';
        query_set='paris6k';
    case {'1'}
        test_set='holidays';
        train_set='oxford5k';
    case {'r5'}
        test_set='roxford5k';
        query_set='roxford5k';
    case {'r6'}
        test_set='rparis6k';
        query_set='rparis6k';
    case {'106'}
        train_set='oxford5k';
        test_set='paris106k';
        query_set='paris6k';
        query_files = dir(fullfile(datapath,net,'\datasets\',['paris6k','_nquery'],'*.mat'));
    case {'105'}
        train_set='paris6k';
        test_set='oxford105k';
        query_set='oxford5k';
        query_files = dir(fullfile(datapath,net,'\datasets\',['oxford5k','_nquery'],'*.mat'));
end

eval(['load gnd_' test_set '.mat']);
if ~exist("query_files","var")
    query_files = dir(fullfile(datapath,net,'\datasets\',[test_set,'_cquery'],'*.mat'));
end
test_files = dir(fullfile(datapath,net,'\datasets\',test_set,'*.mat'));
train_files = dir(fullfile(datapath,net,'\datasets\',train_set,'*.mat'));

test_index=rand_sum_sorting(test_files,k);

fprintf('Extracting test set features...\n')
eval(['load gnd_' test_set '.mat']);
test_features=features_aggregation(test_files,imlist,test_index,g_num);

fprintf('Extracting train set features...\n')
eval(['load gnd_' train_set '.mat']);
train_features=features_aggregation(train_files,imlist,test_index,g_num);

test_features_normalize=normalize(test_features,2,"norm");
train_features_normalize=normalize(train_features,2,"norm");
eval(['load gnd_' test_set '.mat']);
warning off;
query_nocrop_features_normalize=test_features_normalize(qidx,:);
display_query_result(net,test_set,train_features_normalize,test_features_normalize,query_nocrop_features_normalize,gnd,qe,dis);


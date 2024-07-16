% This code uses VGG16 to extract the features of the pool5 layer of the image. Each subsection can be run independently. 
                         

%%%%%%%%%%%%%%%%%%%%%% extract_paris6k %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
net=vgg16; 
layer='pool5';
load('gnd_paris6k.mat')
datasetPath = dir("I:\datasets\paris6k_image\*.jpg");
minsize=224;
parfor i=1:length(datasetPath)
    imgPath = [datasetPath(i).folder,'\',datasetPath(i).name];
    im = imread(imgPath);
    [h,w,~]=size(im);
    if w<minsize || h<minsize
        im = imresize(im, minsize/min(h,w));
    end
    
    pool5 = activations(net,im,layer,'OutputAs','channels');
    parsave(['../data/vgg16/datasets/paris6k_pool5/',erase(datasetPath(i).name,'.jpg'),'.mat'],pool5);
    
end
%%
%%%%%%%%%%%%%% extract_paris6k_query %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
net=vgg16;
layer='pool5';
load('gnd_paris6k.mat')
datasetPath = dir("I:\datasets\paris6k_image\*.jpg");
minsize=224;
for i=1:length(q_name)
    imgPath = [datasetPath(i).folder,'\',q_name{i},'.jpg'];
    im = imread(imgPath);
    % im = crop_qim(im, gnd(i).bbx);%If you need to crop the image for your search, use this line of code
    [h,w,~]=size(im);

    %%%%%%%%%%%%%Resize%%%%%%%%
    if w<minsize || h<minsize
        im = imresize(im, minsize/min(h,w));
    end
    pool5 = activations(net,im,layer,'OutputAs','channels');
    parsave(['../data/vgg16/datasets/paris6k_nquery_pool5/',q_name{i},'.mat'],pool5);

end
%%
%%%%%%%%%%%%%%%%%%%%%% extract_oxford5k %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
net=vgg16; 
layer='pool5';
load('gnd_oxford5k.mat')
datasetPath = dir("I:\datasets\oxford5k_image\*.jpg");
minsize=224;
parfor i=1:length(datasetPath)
    imgPath = [datasetPath(i).folder,'\',datasetPath(i).name];
    im = imread(imgPath);
    [h,w,~]=size(im);
    if w<minsize || h<minsize
        im = imresize(im, minsize/min(h,w));
    end
    
    pool5 = activations(net,im,layer,'OutputAs','channels');
    parsave(['../data/vgg16/datasets/oxford5k/',erase(datasetPath(i).name,'.jpg'),'.mat'],pool5);
    
end

%%
% %%%%%%%%%%%%% extract_oxford5k_query %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
net=vgg16;
layer='pool5';
load('gnd_oxford5k.mat')
datasetPath = dir("I:\datasets\oxford5k_image\*.jpg");
minsize=224;
for i=1:length(q_name)
    imgPath = [datasetPath(i).folder,'\',q_name{i},'.jpg'];
    im = imread(imgPath);
    % im = crop_qim(im, gnd(i).bbx);%If you need to crop the image for your search, use this line of code
    [h,w,~]=size(im);

    %%%%%%%%%%%%%Resize%%%%%%%%
    if w<minsize || h<minsize
        im = imresize(im, minsize/min(h,w));
    end
    pool5 = activations(net,im,layer,'OutputAs','channels');
    parsave(['../data/vgg16/datasets/oxford5k_nquery_pool5/',q_name{i},'.mat'],pool5);

end

%%
%%%%%%%%%%%%%%%%%%%%%%%%% extract_holidays %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
net=vgg16;
load('gnd_holidays.mat')
layer='pool5';
datasetPath = dir("I:\datasets\holidays_upright_version_image\*.jpg");

for i=1:length(datasetPath)
    imgPath = [datasetPath(i).folder,'\',datasetPath(i).name];
    im = imread(imgPath);
    [h,w,~]=size(im);
    im=imresize(im, 0.5);
     if w<224 || h<224
        im = imresize(im, 224/min(h,w));
    end
    pool5 = activations(net,im,layer,'OutputAs','channels');
    parsave(['../data/vgg16/datasets/holidays_pool5/',erase(datasetPath(i).name,'.jpg'),'.mat'],pool5);
end
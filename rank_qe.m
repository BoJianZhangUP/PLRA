function [ranks_QE] =rank_qe(PW_test_features_pca, qvecs, ranks,qe)
qnd_qe = qe;

% QE

% qvecs_qe = qvecs;
% 
% for i=1:size(qvecs,2)
%  
%        qvecs_qe(:,i) = mean([qvecs(:,i) PW_test_features_pca(:,ranks(1:qnd_qe,i))],2);  
% 
% end
% [~,index1]=sort(abs(qvecs-qvecs_qe),'descend');
% 
% qvecs_qe = normalize(qvecs_qe,1,'norm');
% PW_dist=pdist2(PW_test_features_pca',qvecs_qe','euclidean');%计算L2距离
% [~, ranks_QE] = sort(PW_dist, 'ascend');


% t=size(PW_test_features_pca,1);
% for i=1:size(qvecs,2)
%        
% %        [~,index1]=sort(var(PW_test_features_pca(:,ranks(1:qnd_qe,i)),0,2),'ascend');
%           [max_a,index1]=max(PW_test_features_pca(:,ranks(1:qnd_qe,i)),[],2);
% %        qvecs_qe(index1(1:t/2),i) = mean([qvecs(index1(1:t/2),i) PW_test_features_pca(index1(1:t/2),ranks(1:qnd_qe,i))],2); 
%          qvecs_qe=max_a;
% 
% end
% 
% qvecs_qe = normalize(qvecs_qe,1,'norm');
% PW_dist=pdist2(PW_test_features_pca(index1(1:t/2),:)',qvecs_qe(index1(1:t/2),:)','euclidean');%计算L2距离
% [~, ranks_QE] = sort(PW_dist, 'ascend');



% qvecs_qe = qvecs;
% t=size(PW_test_features_pca,1);
% for i=1:size(qvecs,2)
%        
% %        [~,index1]=sort(var(PW_test_features_pca(:,ranks(1:qnd_qe,i)),0,2),'ascend');
%           [max_a,index1]=max(PW_test_features_pca(:,ranks(1:qnd_qe,i)),[],2);
% %        qvecs_qe(index1(1:t/2),i) = mean([qvecs(index1(1:t/2),i) PW_test_features_pca(index1(1:t/2),ranks(1:qnd_qe,i))],2); 
%          qvecs_qe=max_a;
% 
% end
% 
% qvecs_qe = normalize(qvecs_qe,1,'norm');
% PW_dist=pdist2(PW_test_features_pca',qvecs_qe','euclidean');%计算L2距离
% [~, ranks_QE] = sort(PW_dist, 'ascend');


qvecs_qe = qvecs;
t=size(PW_test_features_pca,1);

for i=1:size(qvecs,2)
 
       qvecs_qe(:,i) = mean([qvecs(:,i) PW_test_features_pca(:,ranks(1:qnd_qe,i))],2);  
  
end
[dis,index1]=sort(abs(qvecs-qvecs_qe),'descend');


% for i=1:size(qvecs,2)
%     for j=1:size(qve)
%      qvecs_qe((t/2)+1:t,i)=0;
% end


qvecs_qe = normalize(qvecs_qe,1,'norm');
PW_dist=pdist2(PW_test_features_pca(index1(1:t),:)',qvecs_qe(index1(1:t),:)','euclidean');%计算L2距离
[~, ranks_QE] = sort(PW_dist, 'ascend');



end
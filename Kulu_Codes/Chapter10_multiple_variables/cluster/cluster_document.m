clear;clc;
rng('default'); % For reproducibility
X = [(randn(200,2)*0.75)+1;
    (randn(200,2)*0.25)-1];
X=zscore(X);%对数据矩阵进行标准化处理
scatter(X(:,1),X(:,2));
title('Randomly Generated Data');
Z = linkage(X,'ward');
dendrogram(Z);
% T = cluster(Z,'cutoff',4,'Depth',6);
T = cluster(Z,'maxclust',5);
gscatter(X(:,1),X(:,2),T)
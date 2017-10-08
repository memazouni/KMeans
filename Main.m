%% you must add this directory and subdirectories to search path.
%%Mohamadjavad Bahmani
addpath(genpath('../code'));
clear all;
close all;
clc;

% 2 dimensions data
% load('data2.mat')   % linearly seperatable 
% load('data3.mat') % linearly non-seperatable
load('data2.mat');
dim =2;
correspondence = training_data(3,:);
training_data = training_data(1:2,:);
groundTruth = test_data(3,:);
test_data = test_data(1:2,:);

% testSet, trainingSet => D X N 
% D : 9 => 8(Dimensions of Feature Vector), 1(Correspondence)
% N : Number of Data
% K : Number of Classes


USE_KMEANS = 1;



%% 4) k-means clustering (# of clusters = 4, class label is unknown.)
if USE_KMEANS
    disp('------------Kmeans Clustering------------')
    K = 4;
    result5 = KmeansClustering(training_data,K,1);
    clusters = zeros(1,K);
    for i=1:K
        clusters(1,i) = mode(result5(correspondence==i));
    end

    clusters = zeros(1,K);
    for i=1:K
        clustering_result = result5(correspondence==i);  % get clustering result of i cluster.
        n_samples = length(clustering_result);
        cluster = mode(clustering_result);
        n_outliers = sum(clustering_result~=cluster);
        fprintf('cluster %d(ground truth)\n',i);
        fprintf('\tclass(%d) is clusterd as class(%d)\n',i,cluster);
        fprintf('\t%d samples in %d samples(%f %%) are out of cluster\n',n_outliers, n_samples,n_outliers/n_samples*100);
    end

    if K==4 && dim==2
        figure('name','K-means Clustering');
        subplot(1,2,1);
        plotClusters(training_data,correspondence);
        title('ground truth')
        subplot(1,2,2);
        plotClusters(training_data,result5);
        title('clustering result')
    end
end
%% auto arrange multiple figures
autoArrangeFigures(0,0)

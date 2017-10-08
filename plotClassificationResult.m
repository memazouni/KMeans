function [ ] = plotClassificationResult(figuretitle, test_data,groundTruth,result,dim,K)
%%Mohamadjavad Bahmani
if dim == 2 && K == 4
    figure('name',figuretitle);
    subplot(1,2,1)
    plot(test_data(1,groundTruth==1),test_data(2,groundTruth==1),'r.');hold on;
    plot(test_data(1,groundTruth==2),test_data(2,groundTruth==2),'b.');
    plot(test_data(1,groundTruth==3),test_data(2,groundTruth==3),'k.');
    plot(test_data(1,groundTruth==4),test_data(2,groundTruth==4),'m.');
    title('ground truth')
    subplot(1,2,2)
    plot(test_data(1,result==1),test_data(2,result==1),'r.');hold on;
    plot(test_data(1,result==2),test_data(2,result==2),'b.');
    plot(test_data(1,result==3),test_data(2,result==3),'k.');
    plot(test_data(1,result==4),test_data(2,result==4),'m.');
    title('classfication result')
end
end


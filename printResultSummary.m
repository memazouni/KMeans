function [  ] = printResultSummary( training_data, test_data,groundTruth, result )
error2_1_cnt = size(result(result~=groundTruth),2);
fprintf('TrainingDataSet   : %d\n',size(training_data,2))
fprintf('TestDataSet       : %d\n',size(test_data,2))
fprintf('mis-classified    : %d\n',error2_1_cnt)
fprintf('error rate        : %.2f %%\n',error2_1_cnt/size(test_data,2)*100)
end


clear all;
clc;
%loading data
load('ProjectedData_linearKPCA_FHI')

Label = [];
for i=1:5
    Label = [Label; i*ones(1100,1)];
end

X = [Label, data_out];
Test = [];
Train = [];
for i = 1:5
    ref = ((i-1)*1100);
    Train = [Train; X( (ref+1):(ref+800), :)];
    Test = [Test; X( (ref+800+1):(ref+1100), :)];
    
end

csvwrite('ProjectedData_linearKPCA_FHI_Train.csv',Train)
csvwrite('ProjectedData_linearKPCA_FHI_Test.csv',Test)
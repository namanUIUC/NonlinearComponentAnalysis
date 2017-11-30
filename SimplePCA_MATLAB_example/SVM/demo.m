%% Multi-Class SVM
%% Demo Begin
%% Initialize all to default
clc
clear all
close all
%% number of samples and Class initialization 
nOfSamples=100;
nOfClassInstance=10;
Sample=rand(nOfSamples,60);
class=round(rand(nOfSamples,1)*(nOfClassInstance-1));
%% SVM Classification
Model=svm.train(Sample,class);
predict=svm.predict(Model,Sample);
% [Model,predict] = svm.classify(Sample,class,Sample);
disp('class predict')
disp([class predict])
%% Find Accuracy
Accuracy=mean(class==predict)*100;
fprintf('\nAccuracy =%d\n',Accuracy)
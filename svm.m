clc
clear all
close all
load fisheririrs
inds = ~strcmp(species,'setosa')
X = meas(inds,1:2);
y = species(inds);

s = fitcsvm(X,y)
classOrder = s,ClassNames
sv = s,SupportVectors;

figure
gscatter(X(:,1),X(:,2),y)
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
legend('versicolor','virginica','Support Vectors')
hold off

X = meas(:,1:2);
y = ones(size(X,1),1);
rng(1);
SVMModel = fitcsvm(X,y,'KernelScale','auto','Standardize',true ,'OutlierFraction',0.05);
svind = s.IsSupportVector;
h=0.02;
[X1,X2] = meshgrid(min(X))
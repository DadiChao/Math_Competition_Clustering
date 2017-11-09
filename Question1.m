close all;
clear;

% Load data
load('/Users/Devin/Desktop/Clustering/Problem/Data/Question1/1.mat');
xn=data;
result=zeros(100,100);

for i=1:100
    for j=1:100
        temp=xn(i,:)-xn(j,:);
        result(i,j)=norm(temp);
    end
end

[Vmax,Imax]=max(result(:));
[Vmin,Imin]=min(result(:));
close all;
clear;

load('/Users/Devin/Desktop/Clustering/Problem/Data/Question3/3c.mat');

a=data(:,1);

for i=1:48
    for j=1:42
        b(i,j)=a((i-1)*42+j);
    end
end

I = mat2gray(b');
imshow(I);
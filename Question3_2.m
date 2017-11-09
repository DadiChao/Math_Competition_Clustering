clear;
load('/Users/Devin/Desktop/Clustering/Problem/Data/Question3/3c.mat')
x=data(:,1);
parameter1 = 56;
parameter2 = 2016/parameter1;
newmap=ones(parameter1,parameter2);
for i=1:parameter1
    for j=1:parameter2
        newmap(i,j)=x((i-1)*parameter2+j);
    end
end
img=mat2gray(newmap);
figure(1) 
imshow(img);
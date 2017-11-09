close all;
clear;

load('/Users/Devin/Desktop/Clustering/Problem/Data/Question4/4b.mat');
X=data(1,:);
Y=data(2,:);


f=zeros(3);

A = zeros(max(X),max(Y));

for i=1:length(X)
    A(X(i),Y(i))=255;
end
figure(1)
imshow(A);

Temp = A;

for i=1:50
    Temp2 = dilation(Temp);
    Temp = erosion(Temp2);
end

B = Temp;

figure(2)
imshow(B);
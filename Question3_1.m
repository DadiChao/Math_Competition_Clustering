close all;
clear;

% Load data
load('/Users/Devin/Desktop/Clustering/Problem/Data/Question3/3a.mat');
X=data(1,:);
Y=data(2,:);

figure(1)
plot(X,Y,'g*');
hold on

Distance = zeros(1,length(X));
Z=zeros(1,length(X));
Z2=Z;

for i = 1:length(X)
    for j = 1:length(X)
        Distance(i) = Distance(i) + (X(j)-X(i))^2 + (Y(j)-Y(i))^2;
    end
end

CenterIndex = find(Distance == min(Distance));
%CenterIndex = find(X==121);
plot(X(CenterIndex),Y(CenterIndex),'r-o');

X_tocal = X; X_tocal(CenterIndex) = [];
Y_tocal = Y; Y_tocal(CenterIndex) = [];

LEN = length(X_tocal);
for i = 1:LEN
    Vector_x = X_tocal(i) - X(CenterIndex);
    Vector_y = Y_tocal(i) - Y(CenterIndex);
    if Vector_x > 0
        Z(i)=acos(Vector_y/Vector_x)/3.14159265354/2*360;
    else
        Z(i)=360-acos(Vector_y/Vector_x)/3.14159265354/2*360;
    end
end

figure(2)
stem3(X,Y,Z,'b*');

figure(3)
plot(1:length(Z),Z,'r*');

LimitValue = 45;

figure(4)
plot(X,Y,'g*');
hold on;
plot(X(abs(Z-240)<LimitValue),Y(abs(Z-240)<LimitValue),'r*');
plot(X(abs(Z-90)<LimitValue),Y(abs(Z-90)<LimitValue),'r*');
for y=min(Y):max(Y)
    Temp = find(Y==y);
    if length(Temp)>14 && y>135
        plot(X(Temp),Y(Temp),'r*');
    end
end
        
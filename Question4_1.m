close all;
clear;

load('/Users/Devin/Desktop/Clustering/Problem/Data/Question4/4a.mat');
X=data(1,:);
Y=data(2,:);
Z=data(3,:);

Range = 20;
Amount = Range*(Range-1)/2;
Vector0 = [0,0,1];
IndexArray = zeros(1,Range);
ResultArray = zeros(1,length(X));

for i=1:length(X)
    for j=1:Range
        IndexArray(j) = FindNoNearest3D(X,Y,Z,i,j);
    end
    Sum = 0;
    BadCount = 0;
    for j=1:Range-2
        for k = j+1:Range-1
            PointStart = [X(i),Y(i),Z(i)];
            PointEnd1 = [X(IndexArray(j)),Y(IndexArray(j)),Z(IndexArray(j))];
            PointEnd2 = [X(IndexArray(k)),Y(IndexArray(k)),Z(IndexArray(k))];
            Vector1 = PointEnd1 - PointStart;
            Vector2 = PointEnd2 - PointStart;
            Vector3 = cross(Vector1,Vector2);
            Vector3 = Vector3 / norm(Vector3);
            if norm(Vector1)==0 || norm(Vector2)==0 || norm(Vector3)==0
                BadCount = BadCount + 1;
                continue;
            else
                CosVal = sum(Vector3.*Vector0);
                Sum = Sum + abs(CosVal);
            end
        end
    end
    ResultArray(i)=Sum/(Amount-BadCount);
end

mZ = mean(Z);

figure(3)
for i=1:length(ResultArray)
    if ResultArray(i)>0.7
        if Z(i)>mZ
            plot3(X(i),Y(i),Z(i),'r.');
        else
            plot3(X(i),Y(i),Z(i),'c.');
        end
    else
        plot3(X(i),Y(i),Z(i),'y.');
    end
    hold on;
end
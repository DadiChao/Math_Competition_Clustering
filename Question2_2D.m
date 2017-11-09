close all;
clear;

% Load data

load('/Users/Devin/Desktop/Clustering/Problem/Data/Question2/2d.mat');
X=data(1,:);
Y=data(2,:);

% Noise filtering
% Distance_paramter = 0.1
[ X_clean, Y_clean ] = NoiseFiltering( X,Y,0.1 );

% Find center
CenterIndex = FindCenter( X_clean, Y_clean );

% Calculate 3D with z denotes distance
Distance = GetDistance ( X_clean, Y_clean, CenterIndex );

% Find the farest point, used as start point, from the center point
FarIndex = find(Distance==max(Distance));

% To be canceled
Cancelsequence_x = X_clean;
Cancelsequence_y = Y_clean;

% CateNum is the number of categories
CateNum = 4;
CateRes = zeros(CateNum, length(X));

% Tracking
for K = 1:CateNum
    Count = 1;
    DistanceCancel = GetDistance ( Cancelsequence_x, Cancelsequence_y, CenterIndex );
    TarIndex = find(DistanceCancel==max(DistanceCancel));
    for i=1:length(X_clean)/4;
        [x1,y1,x2,y2]=FindNearest(Cancelsequence_x,Cancelsequence_y,TarIndex);
        if length(y2)>1
            continue;
        end
        StartIndex=TarIndex;
        EndPoint1=[x1,y1];
        EndPoint2=[x2,y2];
        StartPoint=[X_clean(StartIndex),Y_clean(StartIndex)];
        Vector1 = EndPoint1-StartPoint;
        Vector2 = EndPoint2-StartPoint;
        InnerProduct = sum(Vector1.*Vector2);
        NormProduct = norm(Vector1)*norm(Vector2);
        AngleCos = InnerProduct/NormProduct;
        % Angle < 15 for a and d
        if AngleCos > 0.95
            CateRes(K,Count)=TarIndex;
            Count = Count + 1;
        end
        Cancelsequence_x(TarIndex)=X_clean(CenterIndex);
        Cancelsequence_y(TarIndex)=Y_clean(CenterIndex);
        TarIndex = find(Cancelsequence_x==x1);
    end
end

figure(1)
for i=1:CateNum
for j=1:length(X)
    if CateRes(i,j)>0
        if i<3
            plot(X_clean(CateRes(i,j)),Y_clean(CateRes(i,j)),'r.');hold on;
          hold on;
        else
            plot(X_clean(CateRes(i,j)),Y_clean(CateRes(i,j)),'g.');hold on;
        end
    else break
    end
end
end
title('Result using TTC algorithm');
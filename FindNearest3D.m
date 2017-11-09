function [FarIndex1,FarIndex2] = FindNearest3D(X,Y,Z,TarIndex)

% Input
% X is x values of the sequence
% Y is y values of the sequence
% Z is z values of the sequence
% TarIndex is index of calculated point

% Output
% FarIndex1 is index of 1st farest point
% FarIndex2 is index of 2nd farest point

Distance = zeros(1,length(X));

for i = 1:length(X)
    Distance(i) = (X(i)-X(TarIndex))^2 + (Y(i)-Y(TarIndex))^2 + (Z(i)-Z(TarIndex))^2;
end

Temp = Distance;
Temp(TarIndex)=[];

Array1 = find(Temp==min(Temp));
FarIndex1 = Array1(1);

Temp(FarIndex1)=[];

Array2 = find(Temp==min(Temp));
FarIndex2 = Array2(1);
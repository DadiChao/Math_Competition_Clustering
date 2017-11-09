function FarIndex = FindNoNearest3D(X,Y,Z,TarIndex,No)

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

B = sort(Distance);
FarIndexTemp = find(Distance == B(No));
FarIndex=FarIndexTemp(1);
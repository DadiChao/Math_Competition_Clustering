function [ Distance ] = GetDistance3D ( X,Y,Z,CenterIndex )
%FETCHLENGTH Summary of this function goes here
%   Detailed explanation goes here

Distance = zeros(1,length(X));

for i=1:length(X)
    Distance(i)=sqrt((X(i)-X(CenterIndex))^2 + (Y(i)-Y(CenterIndex))^2 + (Z(i)-Z(CenterIndex))^2);
end

end
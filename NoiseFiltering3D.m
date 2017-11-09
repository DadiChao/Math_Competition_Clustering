function [ X_clean, Y_clean, Z_clean ] = NoiseFiltering3D( X,Y,Z,Distance_paramter )

X_clean = X; Y_clean = Y; Z_clean = Z;

CancelIndex = [];

for i=1:length(X)
    [Index1,~]=FindNearest3D(X,Y,Z,i);
    NoiseDistance = sqrt((X(Index1)-X(i))^2+(Y(Index1)-Y(i))^2+(Z(Index1)-Z(i))^2);
    if NoiseDistance > Distance_paramter
        CancelIndex=[CancelIndex Index1];
    end
end

X_clean(CancelIndex)=[];
Y_clean(CancelIndex)=[];
Z_clean(CancelIndex)=[];
end


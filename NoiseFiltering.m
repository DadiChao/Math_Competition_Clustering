function [ X_clean, Y_clean ] = NoiseFiltering( X,Y,Distance_paramter )

X_clean = X; Y_clean = Y;
Temp_x = min(X);
Temp_y = min(Y);


for i=1:length(X)
    [x1,y1,~,~]=FindNearest(X,Y,i);
    NoiseDistance = sqrt((x1-X(i))^2+(y1-Y(i))^2);
    if NoiseDistance > Distance_paramter
        X_clean(i)=Temp_x - 10;
        Y_clean(i)=Temp_y - 10;
    end
end

X_clean(X_clean==Temp_x - 10)=[];
Y_clean(Y_clean==Temp_y - 10)=[];

end


close all;
clear;

load('/Users/Devin/Desktop/Clustering/Problem/Data/Question2/2b.mat');
X=data(1,:);
Y=data(2,:);
Z=data(3,:);
figure(1)

% Distance_paramter
%[ X_clean, Y_clean, Z_clean ] = NoiseFiltering3D( X,Y,Z,0.8 );
X_clean = X;
Y_clean = Y;
Z_clean = Z;

% Find center
CenterIndex = FindCenter3D( X_clean, Y_clean, Z_clean );
figure(1)
plot3(X_clean, Y_clean, Z_clean,'g*');hold on
ylabel('Filter noise');
plot3(X_clean(CenterIndex),Y_clean(CenterIndex),Z_clean(CenterIndex),'r-o');hold on;

Vector1=[1,0,0];
Temp = zeros(1,length(X_clean));
for i=1:length(X_clean)
    Vector2=[X_clean(i),Y_clean(i),Z_clean(i)];
    a(i)=-Vector2(3)/Vector2(2);
    Vector3=[0,a(i),1];
    quiver3(0,0,0,0,a(i),1);hold on;
end

figure(2)
plot(a);

figure(3)
for i=1:length(X_clean)
    if a(i)<-0.4
        plot3(X_clean(i),Y_clean(i),Z_clean(i),'r.');hold on;
    else if a(i)>0.4
            plot3(X_clean(i),Y_clean(i),Z_clean(i),'b.');hold on;
        else
            plot3(X_clean(i),Y_clean(i),Z_clean(i),'g.');hold on;
        end
    end
end

title('Result using TTC algorithm');
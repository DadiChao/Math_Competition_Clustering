function [x1,y1,x2,y2] = FindNearest(X,Y,m)

% Input
% X is x values of sequence Xn
% Y is y values of sequence Xn
% m is index of calculated point

% Output
% x1,y1 is the 1-st nearest point
% x2,y2 is the 2-nd nearest point

% m = CenterIndex;

mx = X(m);
my = Y(m);

X(m)=[];
Y(m)=[];

Temp1 = zeros(1,length(X));

for i = 1:length(X)
    Temp1(i) = (X(i)-mx)^2 + (Y(i)-my)^2;
end

x1 = X(Temp1==min(Temp1));
y1 = Y(Temp1==min(Temp1));

% Remove the 1st nearest
X(X==x1)=[];
Y(Y==y1)=[];

Temp2 = zeros(1,length(X));

for i = 1:length(X)
    Temp2(i) = (X(i)-mx)^2 + (Y(i)-my)^2;
end

x2 = X(Temp2==min(Temp2));
y2 = Y(Temp2==min(Temp2));
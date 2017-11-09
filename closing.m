function O=closing(I,M,it)
% Closes an image I with structuring
% element M; number of closings = it
O=I;
for i=1:it
    O=dilation(O,M);
end
for i=1:it;
    O=erosion(O,M);
end
end
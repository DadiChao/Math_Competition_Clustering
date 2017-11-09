function O=opening(I,M,it)
% Opens an image I with structuring
% element M; number of openings = it
O=I;
for i=1:it;
    O=erosion(O,M);
end
for i=1:it;
    O=dilation(O,M);
end
end
function O=dilation(I)

O = I;
[M,N]=size(I);
for i = 2:M-1
    for j = 2:N-1
        if I(i,j) == 255
            O(i-1,j-1) = 255;
            O(i-1,j) = 255;
            O(i-1,j+1) = 255;
            O(i,j-1) = 255;
            O(i,j+1) = 255;
            O(i+1,j-1) = 255;
            O(i+1,j) = 255;
            O(i+1,j+1) = 255;
        end
    end
end
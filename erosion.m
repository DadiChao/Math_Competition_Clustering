function O=erosion(I)

O = I;
[M,N]=size(I);
for i = 2:M-1
    for j = 2:N-1
        if I(i,j) == 0
            O(i-1,j-1) = 0;
            O(i-1,j) = 0;
            O(i-1,j+1) = 0;
            O(i,j-1) = 0;
            O(i,j+1) = 0;
            O(i+1,j-1) = 0;
            O(i+1,j) = 0;
            O(i+1,j+1) = 0;
        end
    end
end
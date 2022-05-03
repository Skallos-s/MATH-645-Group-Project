function newmat = Duplicate(mat, n)

[r, c] = size(mat);

newmat = zeros(r*n, c*n);

for j=0:n-1
    newmat(r*j+1:r*(j+1), c*j+1:c*(j+1)) = mat;
end
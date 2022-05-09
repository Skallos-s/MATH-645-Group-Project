% Output a larger matrix consisting of an input matrix placed on the
% diagonals.
% Input a matrix and how many copies to place the matrix along a diagonal.
function newmat = Duplicate(mat, n)

% Size of matrix.
[r, c] = size(mat);

% Initialize zero matrix.
newmat = zeros(r*n, c*n);

% Paste input matrix along diagonals.
for j=0:n-1
    newmat(r*j+1:r*(j+1), c*j+1:c*(j+1)) = mat;
end

end
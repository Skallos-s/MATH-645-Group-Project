% 4 Dimensional Rotation Matrix.
% Input axes of plane to rotate along.
function mat = R4D(theta, i, j)

mat = eye(4);
mat(i,i) =  cos(theta);
mat(i,j) =  sin(theta);
mat(j,i) = -sin(theta);
mat(j,j) =  cos(theta);

end
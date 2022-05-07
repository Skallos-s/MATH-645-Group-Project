% Move matrix of a single set of vector points
% to the origin
% i.e. MAT = someOBJ(1:2,:);
function result = moveToOrigin(MAT)
    result = MAT - [getCenterX(MAT); getCenterY(MAT)];
end
% Move matrix of a single set of vector points
% to the origin
% i.e. MAT = someOBJ(1:2,:);
function result = moveToOrigin(MAT)
    result = MAT - [mean(MAT(1,:)); mean(MAT(2,:))];
end
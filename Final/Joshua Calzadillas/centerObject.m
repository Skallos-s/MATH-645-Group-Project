function result = centerObject(OBJ)
%CENTEROBJECT Summary of this function goes here
%   Detailed explanation goes here
    result = zeros(size(OBJ));
    Cx = getCenterX(OBJ);
    Cy = getCenterY(OBJ);
    CordsX = objectXCords(OBJ);
    for k = 1:1:size(CordsX, 2)
        result(k,:)   = OBJ(k,:)   - Cx;
        result(k+1,:) = OBJ(k+1,:) - Cy;
    end
end
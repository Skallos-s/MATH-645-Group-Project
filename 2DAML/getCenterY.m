% Center Y calculation based on given image matrix
function centerY = getCenterY(M)
    % Calculation based on Centroid
    centerY = elementSum(M(2,:)) / size(M(2,:), 2);
end

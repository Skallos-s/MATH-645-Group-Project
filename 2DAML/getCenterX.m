% Center Y calculation based on given image matrix
function centerX = getCenterX(M)
    % if the area of the matrix is not zero
%     if (polyarea(M(1,:), M(2,:), 2) ~= 0)
%         centerX = elementSum(M(1,:)) / polyarea(M(1,:), M(2,:), 2);
%     else
%         % this use case is only used when the area of the matrix is zero
        centerX = elementSum(M(1,:)) / size(M(1,:), 2);
%     end
end
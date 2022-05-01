% Flip Points along the X Axis
% Based on the centroid of the image matrix
% FlipXY also has a scale factor so if you want to flip it along X
% or flip it along y (only) scaleX = 1 and or scaleY = 1.
% if you want to flip it along one axis Scale X or Y must = 0
function result = flipXY(m, scaleX, scaleY)
    % Getting Center Points
    centerX = getCenterX(M);
    centerY = getCenterY(M);
    m = M; % Temporary Matrix
    A = [-(1 * scaleX) 0; 0 -(1 * scaleY)]; % Transformation Matrix

    % Iterative Process of 'normalizing' the matrix
    for i = 1:1:size(m, 1)
        for j = 1:1:size(m, 2)
            if (i == 1)
                m(i,j) = m(i, j) - centerX;
            else
                m(i,j) = m(i, j) - centerY;
            end
        end
    end

    % Applying the transformation matrix to the associative matrix
    result = A * m;

    % Iterative process of 'returning' the matrix
    for i = 1:1:size(result, 1)
        for j = 1:1:size(result, 2)
            if (i == 1)
                result(i,j) = result(i, j) + centerX;
            else
                result(i,j) = result(i, j) + centerY;
            end
        end
    end
end
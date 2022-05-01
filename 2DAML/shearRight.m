% Flip Points along the X Axis (based on the centroid of the image matrix)
function result = shearRight(m, value)
% Getting Center Points
    centerX = getCenterX(M);
    centerY = getCenterY(M);
    m = M; % Temporary Matrix
    A = [1 value; 0 1]; % Transformation Matrix

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
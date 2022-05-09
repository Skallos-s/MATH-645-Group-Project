% Rotate the image around itself
% Theta is in radians
function result = rotateObject(M, theta)
    % Getting Center Points
    centerX = getCenterX(M);
    centerY = getCenterY(M);
    XCords = objectXCords(M);
    m = M; % Temporary Matrix
    A = [cos(theta) -sin(theta); sin(theta) cos(theta)]; % Transformation Matrix

   % Iterative Process of 'normalizing' the matrix
    for k = 1:1:size(XCords,2)
        m(k,:)   = m(k, :)   - centerX;
        m(k+1,:) = m(k+1, :) - centerY;
    end

    % Applying the transformation matrix to the associative matrix
    result = A * m;

    % Iterative process of 'returning' the matrix
    for k = 1:1:size(XCords,2)
        m(k,:)   = m(k, :)   + centerX;
        m(k+1,:) = m(k+1, :) + centerY;
    end
end
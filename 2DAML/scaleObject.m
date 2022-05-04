% Change the scale of the matrix
function result = scaleObject(m, value)
    % Getting Center Points
    centerX = getCenterX(m);
    centerY = getCenterY(m);
    XCords = objectXCords(m);
    A = [value 0; 0 value]; % Transformation Matrix

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
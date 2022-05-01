function m = moveToOrigin(m)
    % Get center points
    centerX = getCenterX(m);
    centerY = getCenterY(m);

    % Iterative move to the origin
    for i = 1:1:size(m, 1)
        for j = 1:1:size(m, 2)
            if (i == 1)
                m(i,j) = m(i, j) - centerX;
            else
                m(i,j) = m(i, j) - centerY;
            end
        end
    end
end
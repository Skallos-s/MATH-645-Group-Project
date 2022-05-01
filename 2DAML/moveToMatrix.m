% Move a matrix that was placed at one place, to another place
% move matrix m back to matrix m1
function mto = moveToMatrix(m, m1)
    mto = zeros(size(m1,1), size(m1,2));
    [centerX, centerY] = getCenter(m1); % Get the center points
    for i = 1:1:size(m, 1)
        for j = 1:1:size(m, 2)
            if (i == 1)
                mto(i,j) = m(i, j) + centerX;
            else
                mto(i,j) = m(i, j) + centerY;
            end
        end
    end
end
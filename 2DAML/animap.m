% Plot Points into a specific Graph Fieldmap
function map = animap(points, color)
    % Plot the transformation
    fill(points(1,:), points(2,:), color)
    %axis([-300 300 -400 400])
end
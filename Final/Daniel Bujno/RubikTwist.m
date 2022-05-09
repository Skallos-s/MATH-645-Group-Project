% Rotate a side of a Rubik's Cube.
% Specifically for the Rubik's Cube Mini Animation.
% Input Rubik's Cube data and colors, animation index, rotation axis,
% layer, and direction to rotate the side.
% Output modified puzzle data and new animation index.
function [data, j] = RubikTwist(data, leng, colors, j, axis, layer, spin)
[~, x] = size(data);

% Rotation matrix.
switch axis
    case 1
        A = Rx(pi/20*spin);
    case 2
        A = Ry(pi/20*spin);
    case 3
        A = Rz(pi/20*spin);
end

% List of vertices of stickers to rotate to be assigned.
active = zeros(1,84);
ind = 1; % Vector indexing variable.
for k=1:x
    % If the vertex should be turned, store the index.
    if layer * data(axis,k) >= 1/3
        active(ind) = k;
        ind = ind+1;
    end
end

% Rotate view of puzzle and turn a side at the same time.
for j=j:j+9
    % Rotate the selected vertices.
    for k=1:84
        ind = active(k);
        data(:,ind) = A * data(:,ind);
    end

    % Rotate view and plot Rubik's Cube
    ndata = Rx(-pi/10) * Ry(pi*j/25/2) * data;
    PlotShape(ndata,leng, [-3,3,-3,3], colors)
    hold off
    pause(0.05)
end
j=j+1; %Increment animation index again for correction.

end
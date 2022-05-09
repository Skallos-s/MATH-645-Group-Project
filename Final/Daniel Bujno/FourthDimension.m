% Four Dimensional Cube Mini Animation
function s = FourthDimension();

% Animate line being formed.
for ind=0:100
    plot([-ind/100,ind/100], [0,0], 'r')
    axis([-3,3,-3,3])
    pause(0.01)
end

% Generate data for square.
[~, Edges] = HyperCube(2);
[~, x] = size(Edges);

% Animate square being formed from a line.
for ind=0:100
    A = Duplicate(R2D(pi/50*ind), 2); % Rotation matrix.
    I = eye(4); % Stretching matrix.
    I(2,2) = ind/100;
    I(4,4) = ind/100;

    % Calculate new data and plot.
    nEdges = A * I * Edges;
    for edge=1:x
        e = nEdges(:,edge);
        plot([e(1),e(3)], [e(2),e(4)], 'r')
        hold on
    end

    % Reset axis.
    hold off
    axis([-3,3,-3,3])
    pause(0.01)
end

% Generate data for cube
[~, Edges] = HyperCube(3);
[~, x] = size(Edges);

% Animate cube being formed from a square.
for ind=0:100
    A = Duplicate(Rx(3*pi*ind/100) * Ry(pi*ind/50), 2); % Rotation matrix.
    I = eye(6); % Stretching matrix.
    I(3,3) = ind/100;
    I(6,6) = ind/100;

    % Calculate new data and plot.
    nEdges = A * I * Edges;
    for edge=1:x
        e = nEdges(:,edge);
        plot([e(1),e(4)], [e(2),e(5)], 'r')
        hold on
    end

    % Reset axis.
    hold off
    axis([-3,3,-3,3])
    pause(0.01)
end

% Generate data for hypercube.
[~, Edges] = HyperCube(4);
[~, x] = size(Edges);

% Animate hypercube being formed from a cube.
for ind=0:150
    % Multi-rotation matrix.
    % Rotate hypercube along two separate planes.
    % Slowly rotate hypercube along axis in projected space to get slightly
    % different angle of hypercube.
    A = Duplicate(R4D(pi/50*ind, 1, 4)*R4D(pi/400*ind,2,3)*R4D(pi/50*ind, 3, 4), 2);
    I = eye(8);
    I(4,4) = ind/100;
    I(8,8) = ind/100;

    % Calculate new data and plot.
    % Stretching is not centered to allow outer cube to remain same size.
    % Shift cube along 4D space as the cube expands into a hypercube.
    nEdges = A * (I * Edges + [0;0;0;1-ind/100;0;0;0;1-ind/100]);
    for edge=1:x
        % Decrease size of vertices further in 4D space.
        e = nEdges(:,edge);
        c = e(4)/4+3/4;
        d = e(8)/4+3/4;
        plot([c*e(1),d*e(5)], [c*e(2),d*e(6)], 'r')
        hold on
    end

    % Reset axis.
    axis([-3,3,-3,3])
    hold off
    pause(0.01)
end

% Output string.
s = "4D";

end
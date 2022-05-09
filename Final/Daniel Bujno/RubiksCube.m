% Rubik's Cube Solving Mini Animation.
function s = RubiksCube()

% Generate Rubik's Cube data.
[data,leng,colors] = Rubik(1, 0.1);
j = 0; % Animation index.

% Plot starting frame of puzzle.
ndata = Rx(-pi/10) * data;
PlotShape(ndata,leng, [-3,3,-3,3], colors)
hold off
pause(1)

% Given solve move sequence.
% U F' L2 U D' R' U2 R F' D R2 L D2 L2 U' L2 B2 U2
% The following is a hard-coded solve of the given scramble.
[data, j] = RubikTwist(data, leng, colors, j, 2,  1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 1,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2,  1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 2, -1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 3,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2,  1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 2,  1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 3,  1,  1);
[data, j] = RubikTwist(data, leng, colors, j, 1,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2,  1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 3, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 1, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 1, -1, -1);
[data, j] = RubikTwist(data, leng, colors, j, 2,  1, -1);
[   ~, ~] = RubikTwist(data, leng, colors, j, 2,  1, -1);
pause(1)

s = "RUBIK";

end
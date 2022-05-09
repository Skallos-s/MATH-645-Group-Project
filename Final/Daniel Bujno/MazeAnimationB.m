% Outro Maze Animation.
function MazeAnimationB()

% Generate wall data and colors.
[Walls, Colors] = EndLine();

% Field of view and animation index.
FoV = pi/2;
PauseStep = 0.01;

% Rotate 180 from screen.
steps = [pi:-0.05:0;pi:0.05:2*pi];
for j=steps(randi(2),:) % Choose what direction to rotate 180.
    DrawMaze(Walls, [0.5,0.5,j], FoV, Colors, 2, "", 0)
    hold off
    pause(PauseStep)
end

% Walk forward until the maze is left.
for j=0.5:0.05:6.5
    DrawMaze(Walls, [0.5,j,0], FoV, Colors, 2, "", 0)
    hold off
    pause(PauseStep)
end

% Generate Icosahedron data.
[data,leng] = Icosahedron(0.75);

% Draw the Icosahedron sun.
for j=5:-0.1:1.5
    % Plot floor and sky.
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    hold on
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')
    
    % Calculate new Icosahedron rotation and translation.
    tran = [0;j;0];
    ndata = Rx(pi*j/3) * Ry(2*pi*j/3) * data + tran;
    
    % Plot shape.
    PlotShape(ndata,leng, [-3,3,-3,3], 'y')
    hold off
    pause(0.01)
end

end
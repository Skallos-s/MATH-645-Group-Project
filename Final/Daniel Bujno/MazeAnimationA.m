% Intro and Interim Maze Animations.
% DoIntro determines if intro should be played.
% s is string modifier.
function MazeAnimationA(DoIntro, s)

% Determine if the left or right path shall be taken.
TurningLeft = randi(2)==1;
PauseStep = 0.01; % How quickly the maze is traversed.



% Pick if a bend or T intersection is chosen.
if TurningLeft
    c = 2;
    if randi(2)==1
        [Walls, Colors] = LeftBend(DoIntro, s);
    else
        [Walls, Colors] = LeftT(DoIntro, s);
    end
else
    c = -2;
    if randi(2)==1
        [Walls, Colors] = RightBend(DoIntro, s);
    else
        [Walls, Colors] = RightT(DoIntro, s);
    end
end

% If any of 'rgby' string modifiers are given, restrict wall colors to the
% given 'rgby' color.
if s == 'r'
    Colors(2:3,:) = 0;
end
if s == 'g'
    Colors(1,:) = 0;
    Colors(3,:) = 0;
end
if s == 'b'
    Colors(1:2,:) = 0;
end
if s == 'y'
    Colors(3,:) = 0;
end

% Field of view and animation index.
if s=="monster"
    FoV = 2*pi/3;
    speed = 2;
else
    FoV = pi/2;
    speed = 1;
end
k = 0;

% For interim animation, rotate 180 from screen.
% For intro animation, walk forward from further behind.
if ~DoIntro
    steps = [pi:-speed*0.05:0;pi:speed*0.05:2*pi];
    for j=steps(randi(2),:) % Choose what direction to rotate 180.
        DrawMaze(Walls, [2.5,0.5,j], FoV, Colors, 0, s, k)
        k = k + 1;
        hold off
        pause(0.01)
    end
else
    for j=-2.5:speed*0.05:0.5
        DrawMaze(Walls, [2.5,j,0], FoV, Colors, 1, s, k)
        k = k + 1;
        hold off
        pause(PauseStep)
    end
end

% Walk forward to end of corridor.
for j=0.5:speed*0.05:2.5
    DrawMaze(Walls, [2.5,j,0], FoV, Colors, 0, s, k)
    k = k + 1;
    hold off
    pause(PauseStep)
end

% Rotate left or right.
for j=0:speed*sign(c)*0.05:sign(c)*pi/2
    DrawMaze(Walls, [2.5,2.5,j], FoV, Colors, 0, s, k)
    k = k + 1;
    hold off
    pause(PauseStep)
end

% Walk forward to screen.
for j=2.5:-speed*sign(c)*0.05:2.5-c
    DrawMaze(Walls, [j,2.5,sign(c)*pi/2], FoV, Colors, 0, s, k)
    k = k + 1;
    hold off
    pause(PauseStep)
end
hold off

end
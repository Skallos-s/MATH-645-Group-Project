function MazeAnimationB(DoIntro)

TurningLeft = randi(2)==1;
PauseStep = 0.01;

if TurningLeft
    c = 2;
    if randi(2)==1
        [Walls, Colors] = LeftBend(DoIntro);
    else
        [Walls, Colors] = LeftT(DoIntro);
    end
else
    c = -2;
    if randi(2)==1
        [Walls, Colors] = RightBend(DoIntro);
    else
        [Walls, Colors] = RightT(DoIntro);
    end
end

FoV = pi/2;

if ~DoIntro
    steps = [pi:-0.05:0;pi:0.05:2*pi];
    for j=steps(randi(2),:)
        DrawMaze(Walls, [2.5,0.5,j], FoV, Colors, 0)
        hold off
        pause(0.01)
    end
else
    for j=-2.5:0.05:0.5
        DrawMaze(Walls, [2.5,j,0], FoV, Colors, 1)
        hold off
        pause(PauseStep)
    end
end
for j=0.5:0.05:2.5
    DrawMaze(Walls, [2.5,j,0], FoV, Colors, 0)
    hold off
    pause(PauseStep)
end
for j=0:sign(c)*0.05:sign(c)*pi/2
    DrawMaze(Walls, [2.5,2.5,j], FoV, Colors, 0)
    hold off
    pause(PauseStep)
end
for j=2.5:-sign(c)*0.05:2.5-c
    DrawMaze(Walls, [j,2.5,sign(c)*pi/2], FoV, Colors, 0)
    hold off
    pause(PauseStep)
end
hold off
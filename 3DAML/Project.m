% clear any previously stored data
clear
clf
clc

% Maze Animation Start
MazeAnimationA(true)

% Animation movement
for j=1:0
    pause(0.1)
    %PlayAnimation(j)
    ScreenOff()
    pause(0.1)
    MazeAnimationA(false)
end

% Animation Play 1
pause(0.1)
Animation00()
ScreenOff()

% Last Animation
pause(0.1)
MazeAnimationB()
function MazeAnimationB()

[Walls, Colors] = EndLine();
FoV = pi/2;
PauseStep = 0.01;

steps = [pi:-0.05:0;pi:0.05:2*pi];
for j=steps(randi(2),:)
    DrawMaze(Walls, [0.5,0.5,j], FoV, Colors, 2)
    hold off
    pause(PauseStep)
end

for j=0.5:0.05:6.5
    DrawMaze(Walls, [0.5,j,0], FoV, Colors, 2)
    hold off
    pause(PauseStep)
end

[data,leng] = Icosahedron(0.75);

for j=5:-0.1:1.5
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    hold on
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')

    tran = [0;j;0];
    ndata = Rx(pi*j/3) * Ry(2*pi*j/3) * data + tran;

    plotshape(ndata,leng, [-3,3,-3,3], 'y')
    hold off
    pause(0.01)
end
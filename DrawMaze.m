function DrawMaze(Walls, Camera, FoV, Colors, Debug)

zoom = 3;
NewWalls = zoom * R2D(Camera(3)) * (Walls-[Camera(1);Camera(2);Camera(1);Camera(2)]);
[~,x] = size(NewWalls);

scale = 3 * cot(FoV/2);
V = [1, -1; cot(FoV/2), cot(FoV/2)];

fill([-3, 3, 3, -3], ...
     [0,0, 3, 3], [165/256,165/256,165/256])
hold on
fill([-3, 3, 3, -3], ...
     [0,0,-3,-3], [114/256, 75/256, 52/256])

NoWalls = true;

for iwall = 1:x
    wall = NewWalls(:,iwall);
    isvisible = false;
    if (wall(2)>0.001) && (wall(4)>0.001)
        isvisible = true;
        NoWalls = false;
        cwall = wall;
    end
    b1 = V\wall(1:2);
    if (b1(1)<=0) || (b1(2)<=0)
        wall = [wall(3);wall(4);wall(1);wall(2)];
        b1=V\wall(1:2);
    end
    if (b1(1)>=0) && (b1(2)>=0) && not(isvisible)
        isvisible = true;
        NoWalls = false;
        if isabove(wall(1:2), wall(3:4))
            nwall = clamp(wall(1:2), wall(3:4), V(:,1));
        else
            nwall = clamp(wall(1:2), wall(3:4), V(:,2));
        end

        cwall = [wall(1); wall(2); nwall(1); nwall(2)];
    end
    if isvisible
        P1 = scale * [cwall(1), 0.5] / cwall(2);
        P2 = scale * [cwall(3), 0.5] / cwall(4);
        fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(2),-P2(2), P2(2), P1(2)],Colors(:,iwall)');
        if (iwall == x) && (Debug == 1)
            v1 = [-P2(1),-P2(1),-P1(1),-P1(1),P1(1),P1(1),P2(1),P2(1)];
            v2 = zoom*[1,-P2(2),-P2(2),P2(2),P2(2),-P2(2),-P2(2),1];
            fill(v1, v2, Colors(:,iwall)')
        end
        if (iwall == x) &&(Debug == 2)
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(2),-P2(2), 0, 0],'g');
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [ 0, 0, P2(2), P1(2)],'c');
        end
    end
end
if NoWalls && (Debug == 2)
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')
end
axis([-3,3,-3,3])